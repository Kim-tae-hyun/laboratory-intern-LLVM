#include <map>
#include <list>
#include "llvm/Pass.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/Use.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/ADT/StringExtras.h"

using namespace llvm;

namespace {
struct star : public ModulePass {
  static char ID;
  

	star() : ModulePass(ID) {} 

 	virtual bool doInitialization(Module &M) {
	 Mod = &M; 
	 // get constants needed to create a printf call
 	Type *charPointerType = PointerType::get(IntegerType::
	get(Mod->getContext(), 8), 0);
	  FunctionType *printfTy = FunctionType::get(IntegerType::get(Mod->getContext(), 32),
 	std::vector<Type*>(1, charPointerType), true);
	
  	// insert function prototype if needed
 	PrintFunc = M.getOrInsertFunction("printf", printfTy);
	return false;
	}




	bool runOnModule(Module &M) override{

		errs().changeColor(raw_ostream::RED);
		errs() << "Module::iterator" << " ...\n";
		errs().resetColor();

  	  for (Module::iterator F = M.begin(); F != M.end(); ++F)
	    { 

			errs().changeColor(raw_ostream::GREEN);
			errs() << "Function::iterator" << " ...\n";
			errs().resetColor();
		
		  for (Function::iterator BB = F->begin(), EE = F->end(); BB != EE; ++BB) {
			
			errs().changeColor(raw_ostream::YELLOW);
			errs() << "BasicBlock::iterator" << " ...\n";
			errs().resetColor();
			
 			std::vector <Value *> Args;
			IRBuilder<> Builder(dyn_cast<BasicBlock>(BB));
			std::string printString=""; 
	
		  for (BasicBlock::iterator I = BB->begin(), E = BB->end(); I != E; ++I) {

			
			Instruction *instr = dyn_cast<Instruction>(I);

			errs()<<"Instruction::iterator " << "\n";

			printString +="insert>\n";
 			Args.push_back( Builder.CreateGlobalStringPtr(printString.c_str()) );	
 			
			  	  CallInst::Create(PrintFunc, Args, "", instr);
				  Args.clear();
				  printString = "";	
		
	 		
				
			}
		}

		}
			
			errs() << "global_iterator -----------------" << " ...\n";

				for (Module::global_iterator GI = M.global_begin(), E = M.global_end();
					GI != E; ++GI) {

						 errs().changeColor(raw_ostream::GREEN);
						 errs() << "global_iterator name : " << GI->getName() << " ...\n";
			 			errs().resetColor();

					}

	   


  	return true;
	}
	  private:
	  Module *Mod;
	  Constant *PrintFunc;

}; // end of struct Hello
}  // end of anonymous namespace

char star::ID = 0;
static RegisterPass<star> X("star", "star Pass",
                             false /* Only looks at CFG */,
                             false /* Analysis Pass */);

