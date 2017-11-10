#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include "ap_fixed.h"
#include "hls_dsp.h"

using namespace std;

typedef ap_fixed<48,24> fx_data_t;

void sqrt_CORDIC(float returnValue[1000]){
#pragma HLS INTERFACE ap_fifo port=returnValue
//#pragma HLS DATA_PACK variable=returnValue

	const int DataFormat = hls::CORDIC_FORMAT_USIG_FRAC;
	const int InputWidth = 48;
	const int OutputWidth = 25;
	const int RoundMode = hls::CORDIC_ROUND_TRUNCATE;
	hls::sqrt_input<InputWidth, DataFormat>::in input;
	hls::sqrt_output<OutputWidth, DataFormat>::out output;

	for (int i = 0; i < 1000; i++){
//#pragma HLS unroll
		const fx_data_t inputOne = i + 168313;
		input.in = inputOne;

		hls::sqrt<DataFormat,InputWidth,OutputWidth,RoundMode>(input, output);
		returnValue[i] = output.out;
	}

//	for (int i = 0; i < 1000; i++){
//#pragma HLS unroll
//		const float input = i + 168313;
//		const float temp = sqrt(input);
//		returnValue[i] = temp;
//	}

}
