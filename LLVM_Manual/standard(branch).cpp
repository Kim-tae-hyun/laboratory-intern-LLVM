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
#include "llvm/Analysis/LoopPass.h"


#define Before 0
#define After 1



using namespace llvm;
using namespace std;


void Loop::dump() const {
print(dbgs());
}

namespace {
struct standard : public ModulePass {
  static char ID;
  standard(): ModulePass(ID) {}


	Instruction* getNextInstruction(Instruction& i) {
	BasicBlock::iterator it(&i);
	Instruction *pi =  dyn_cast<Instruction>(it); 

	return pi;
	}

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

	
void insert_func(Instruction* I,std::string printString,Constant* func,unsigned char flag){

		std::vector <Value *> Args;
		std::vector <OperandBundleDef> bundles;
		IRBuilder<> Builder(dyn_cast<BasicBlock>(I->getParent()));
		Args.push_back( Builder.CreateGlobalStringPtr(printString.c_str()) );
		if(flag==Before){
		I->getParent()->begin()->getParent()->getInstList().insert(I->getIterator(), CallInst::Create(func, Args, ""));
		}else if(flag==After){
		I->getParent()->begin()->getParent()->getInstList().insertAfter(I->getIterator(), CallInst::Create(func, Args, ""));
		}
}


  bool runOnModule(Module &M) override {
	Mod = &M;
	
	errs().changeColor(raw_ostream::RED);
	errs() << "Module::iterator" << " ...\n";
	errs().resetColor();
	
		
	for(Module::iterator F = M.begin(); F !=M.end(); ++F){

		errs().changeColor(raw_ostream::GREEN);
		errs() << "Function::iterator " << F->getName()<<" ...\n";
		errs().resetColor();

	
		BasicBlock* before;
		for(Function::iterator BB = F->begin(), EE = F->end(); BB !=EE; ++BB) {
		
		
		errs() << "BasicBlock::iterator" << " ...\n";
		errs().resetColor();

		std::string a = BB->getName().str();
		
		
		if((a.find(".cond")!= string::npos ||a.find(".then")!= string::npos )&& a.find("do.")== string ::npos){
		BasicBlock::iterator I= before->begin();
		BasicBlock::iterator E= before->end();
		E--;

		for (; I != E;  ++I); //끝의 전까지 I에다가 넣음

		Instruction* Li = dyn_cast<Instruction>(I);
		insert_func(Li,a+" >\n",Print,Before);

		} else if (a.find(".end")!= string::npos){
			
		Instruction* Fi = dyn_cast<Instruction>(BB->begin());	
		insert_func(Fi,a+" >\n",Print,Before);

		}else if(a.find("do.body") != string ::npos){
			BasicBlock::iterator I= before->begin();
			BasicBlock::iterator E= before->end();
			E--;

			for (; I != E;  ++I);
			Instruction* Li = dyn_cast<Instruction>(I);
			insert_func(Li,a+" >\n",Print,Before);
		}

		before = dyn_cast<BasicBlock>(BB);
		
			
		}
	}
    return false;
  }

  private:
	Module *Mod;
	Constant *Print;

	
	 
}; // end of struct standard
}  // end of anonymous namespace

char standard::ID = 0;
static RegisterPass<standard> X("standard", "standard Pass",
                             false /* Only looks at CFG */,
                             false /* Analysis Pass */);
