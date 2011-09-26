#include "stdafx.h"
#include <stdio.h>
#include <malloc.h>
#include "List.h"

void List::PrintList(void)
{
	List_element *BufferElem = head;
	while (BufferElem != NULL)
	{
		printf("%d\n",BufferElem->value);
		BufferElem = BufferElem->next;
	}
}

List::~List()
{
	List_element *BufferElem;
	while (head != NULL)
	{
		BufferElem = head;
		head = head->next;
		free(BufferElem);
	}
}

int List::GetFirst(void)
{
	List_element *BufferElem;
	int res = 0;
	if (head != NULL)
	{
		BufferElem = head;
		head = head->next;
		head->prev = NULL;
		res = BufferElem->value;
		free(BufferElem);
	}
	return res;
}

void List::AddFirst(int value)
{
	List_element *BufferElem = (List_element*) malloc(sizeof(List_element));
	BufferElem->value = value;
	BufferElem->next = head;
	BufferElem->prev = NULL;
	if (head == NULL) 
		last = BufferElem;
	else
		head->prev = BufferElem;
	head = BufferElem;
}

List::List()
{
	head = last = NULL;
}

void List::BackPrintList(void)
{
	List_element *BufferElem = last;
	while (BufferElem != NULL)
	{
		printf("%d\n",BufferElem->value);
		BufferElem = BufferElem->prev;
	}
}