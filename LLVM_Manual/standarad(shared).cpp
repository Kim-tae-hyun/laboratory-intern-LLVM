#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Type.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/ADT/APSInt.h"
#include "llvm/ADT/Twine.h"
#include "llvm/Analysis/LoopInfo.h"

#define Before 0
#define After 1
using namespace llvm;
using namespace std;




namespace {
struct standard : public ModulePass {
  static char ID;
  standard(): ModulePass(ID) {}


	Instruction* getNextInstruction(Instruction& i) {
	BasicBlock::iterator it(&i);
	Instruction *pi =  dyn_cast<Instruction>(it); 

	return pi;
	}


//	virtual bool doInitialization(Module &M) {

//}

virtual bool doInitialization(Module &M) {
	Mod = &M; 
	 // get constants needed to create a printf call
 	Type *charPointerType = PointerType::get(IntegerType::
	get(Mod->getContext(), 8), 0);
	  FunctionType *printfTy = FunctionType::get(IntegerType::get(Mod->getContext(), 32),
 	std::vector<Type*>(1, charPointerType), true);
	
  	// insert function prototype if needed
 	Print = M.getOrInsertFunction("printf", printfTy);
	return false;
	}


void insert_func(Instruction* I,std::string printString,Constant* func){

		std::vector <Value *> Args;
		std::vector <OperandBundleDef> bundles;
		IRBuilder<> Builder(dyn_cast<BasicBlock>(I->getParent()));
		Args.push_back( Builder.CreateGlobalStringPtr(printString.c_str()) );
		if(flag==Before){
		I->getParent()->begin()->getParent()->getInstList(().insert
		(I->getIterator(), CallInst::create(func,Args,""));
		}else if(flag==After){
		I->getParent()->begin()->getParent()->getInstList(().insertAfter
		(I->getIterator(), CallInst::create(func,Args,""));
		}

}

	

  bool runOnModule(Module &M) override {
	Mod = &M;
	
	

	errs().changeColor(raw_ostream::RED);
	errs() << "Module::iterator" << " ...\n";
	errs().resetColor();
		
	
	for(Module::global_iterator gs = M.global_begin(), ge = M.global_end(); gs != ge; ++gs){
	errs() << "GlobalVariable*   : " << gs->getName();

		for(unsigned int i=0; i<gs->getNumOperands(); i++)
				{
				 errs()<<" | "<<*(gs->getOperand(i));
 				errs()<<" | "<<(gs->getOperand(i));
				}
				errs()<<"\n";

	}


	
	
	for(Module::iterator F = M.begin(); F !=M.end(); ++F){

		errs().changeColor(raw_ostream::GREEN);
		errs() << "Function::iterator " << F->getName()<<" ...\n";
		errs().resetColor();
		

		for(Function::iterator BB = F->begin(), EE = F->end(); BB !=EE; ++BB) {
		
		errs().changeColor(raw_ostream::YELLOW);
		errs() << "BasicBlock::iterator" << " ...\n";
		errs().resetColor();

				
		int flag=0;
		for (BasicBlock::iterator I = BB->begin(), E = BB->end(); I != E;  ++I) {
			Instruction* pi=dyn_cast<Instruction>(I);
				I->dump();

			if(isa<LoadInst>(I)||isa<StoreInst>(I)){

			for(unsigned int i=0; i<I->getNumOperands(); i++)
				{
				
				if(GlobalVariable* tmp=dyn_cast<GlobalVariable>(I->getOperand(i)))
				{
				  if(!tmp->isConstant()){
						flag=1;
					}
					}
				}
			
			}
			if(flag==1)
			{
				
				insert_func(pi,"insert>b",PrintBefore);
				insert_func(pi,"insert>a",PrintAfter);
				flag=0;
			}
 				
			
		}	
			
		}
	}
    return false;
  }

  private:
	Module *Mod;
	Constant *PrintBefore;
	Constant *PrintAfter;
	
	 
}; // end of struct Hello
}  // end of anonymous namespace

char standard::ID = 0;
static RegisterPass<standard> X("standard", "standard Pass",
                             false /* Only looks at CFG */,
                             false /* Analysis Pass */);
