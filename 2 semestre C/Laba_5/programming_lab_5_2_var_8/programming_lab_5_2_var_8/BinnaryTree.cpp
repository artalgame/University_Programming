#include "stdafx.h"
#include "BinnaryTree.h"
#include <stdio.h>
#include <malloc.h>
#include <math.h>
#include <string>

BinnaryTree::BinnaryTree()
{
	Head = NULL;
}

BinnaryTree::~BinnaryTree()  
{
	if (Head != NULL)
	{
		remove(Head);
	}
}

void remove(TreeElem *Tree)
{
	if (Tree->LeftSon != NULL)
		remove(Tree->LeftSon);
	if (Tree->RightSon != NULL)
		remove(Tree->RightSon);
	free(Tree);
}

bool BinnaryTree::ThereElement(int value)
{
	bool res = false;
	TreeElem *BufferElem = Head;

	while (BufferElem != NULL)
		if (BufferElem->value != value) 
			if (value < BufferElem->value)
				BufferElem = BufferElem->LeftSon;
			else
				BufferElem = BufferElem->RightSon;
		else
		{
			res = true;
			break;
		}


	return res;
}

void BinnaryTree::AddElement(int value)
{
	if (!ThereElement(value))
	{
		TreeElem *BufferElem = Head, *PreBuferElem = NULL, *AddedItem = (TreeElem*) malloc(sizeof(TreeElem));
		AddedItem->value = value;
		AddedItem->LeftSon = AddedItem->RightSon = NULL;

		if (Head == NULL) 
			Head = AddedItem;
		else
		{
			while (BufferElem != NULL)
			{
				PreBuferElem = BufferElem;
				if (value < BufferElem->value)
					BufferElem = BufferElem->LeftSon;
				else
					BufferElem = BufferElem->RightSon;	
			}
			if (value < PreBuferElem->value)
				PreBuferElem->LeftSon = AddedItem;
			else
				PreBuferElem->RightSon = AddedItem;
		}

	}
}

bool BinnaryTree::BalancedTree(void)
{ 
	return TreeBalance(Head);
}

int TreeDepth(TreeElem *Tree)
{
	if (Tree != NULL)
	{
		int res = 0, a = TreeDepth(Tree->LeftSon), b = TreeDepth(Tree->RightSon);
		if (a >= b)
			return ++a;
		else
			return ++b;
	}
	else
		return  0;
}

bool TreeBalance(TreeElem *Tree)
{
	if (Tree != NULL)
	{
		bool res = (abs(TreeDepth(Tree->LeftSon) - TreeDepth(Tree->RightSon)) <= 1);
		return res && TreeBalance(Tree->LeftSon) && TreeBalance(Tree->RightSon);
	}
	else
		return true;
}

void BinnaryTree::Print(TreeElem *BufferElement, int level)
{
	if (BufferElement->RightSon!=NULL) 
		Print(BufferElement->RightSon, level + 1);
	for (int i = 0; i < level; ++i)
		printf("\t");
	printf("%d\n",BufferElement->value);

	if (BufferElement->LeftSon != NULL) Print(BufferElement->LeftSon, level + 1);
}
