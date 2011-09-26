struct TreeElem
{
	int value;
	TreeElem *LeftSon, *RightSon;
};

bool TreeBalance(TreeElem *Tree);
int TreeDepth(TreeElem *Tree);
void remove(TreeElem *Tree);

class BinnaryTree
{
public:
	TreeElem *Head;	
	BinnaryTree(); 
	~BinnaryTree(); 
	void AddElement(int value); 
	bool ThereElement(int value); 
	bool BalancedTree(void); 
	void Print(TreeElem *BufferElement, int level = 0); 
};