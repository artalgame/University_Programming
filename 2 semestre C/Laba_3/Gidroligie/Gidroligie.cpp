// Gidroligie.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <math.h>

struct gidrologie_measurement
{
	float RiverDepth, FlowVelocity, DistanceFromLeftShore;
};

float SectionWaterConseption(struct gidrologie_measurement FirstMeasurement, struct gidrologie_measurement SecondMeasurement)
{
	float square = 0, section = 0;
	square = (float) ((FirstMeasurement.RiverDepth + SecondMeasurement.RiverDepth) / 2) * (SecondMeasurement.DistanceFromLeftShore - FirstMeasurement.DistanceFromLeftShore);
	section = square * (abs((SecondMeasurement.FlowVelocity - FirstMeasurement.FlowVelocity)) / 2);
	return section;
}

void _tmain(void)
{
	puts("Enter number of measureents");
	int count = 0;
	scanf("%d", &count);
	gidrologie_measurement *MeasurementArray;
	MeasurementArray = (gidrologie_measurement*) malloc( sizeof( gidrologie_measurement) * (count + 2) );
	MeasurementArray[0].DistanceFromLeftShore = 0;
	MeasurementArray[0].FlowVelocity = MeasurementArray[count + 1].FlowVelocity = 0;
	MeasurementArray[0].RiverDepth = MeasurementArray[count + 1].RiverDepth = 0;
	puts("Enter the vidth of the revier");
	scanf("%f",&MeasurementArray[count + 1].DistanceFromLeftShore);
	for (int i = 1; i<= count; i++)
	{
		printf("Enter Distance From Left Shore, Flow Velocity,\nRiver Depth of  %d number of Measurements\n", i);
		scanf("%f%f%f", &MeasurementArray[i].DistanceFromLeftShore, &MeasurementArray[i].FlowVelocity, &MeasurementArray[i].RiverDepth);
	}
	float WaterConseption = 0;
	for (int i = 0; i <= (count); i++)
		WaterConseption += SectionWaterConseption( MeasurementArray[i], MeasurementArray[i+1]); 
	free(MeasurementArray);
	printf("Water Conseption = %f", WaterConseption);
	getchar();
	getchar();
}

