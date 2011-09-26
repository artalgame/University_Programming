#include "stdafx.h"
#include <stdio.h>
#include <malloc.h>
#include "Queue.h"

void Queue::PrintQueue(void)
{
	Queue_element *BufferElem = head;
	while (BufferElem != NULL)
	{
		printf("%d\n",BufferElem->value);
		BufferElem = BufferElem->next;
	}
}

void Queue::AddElem(int value)
{
	Queue_element *BufferElem = (Queue_element*) malloc(sizeof(Queue_element));
	BufferElem->value = value;
	BufferElem->next = NULL;
	if (head == NULL)
		head = BufferElem;
	else
		last->next = BufferElem;
	last = BufferElem;
}

int Queue::GetElem(void)
{
	Queue_element *BufferElem;
	int res = 0;
	if (head != NULL)
	{
		BufferElem = head;
		head = head->next;
		res = BufferElem->value;
		free(BufferElem);
	}
	return res;
}

Queue::~Queue()
{
	Queue_element *BufferElem;
	while (head != NULL)
	{
		BufferElem = head;
		head = head->next;
		free(BufferElem);
	}
}

Queue::Queue()
{
	head = last = NULL;
}