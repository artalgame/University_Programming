typedef struct List_element
{
	int value;
	struct List_element *next, *prev;
};

class List
{ 
private:
	List_element *head, *last;
public:
	List();
	~List();
	void AddFirst(int value);
	int GetFirst(void);
	void PrintList(void);
	void BackPrintList(void);
};