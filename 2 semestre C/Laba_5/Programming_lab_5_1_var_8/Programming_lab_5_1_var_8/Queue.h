typedef struct Queue_element
{
	int value;
	struct Queue_element* next;
};

class Queue
{
private:
	Queue_element *head, *last;
public:
	Queue();
	~Queue();
	void AddElem(int value);
	int GetElem(void);
	void PrintQueue(void);
};