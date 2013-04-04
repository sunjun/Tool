+ (void)convertPPM565:(unsigned char *)
	PPM565buffer	toPPM888:(unsigned char *)
	PPM888buffer	width:(int)
	width		height:  (int)height
{
	//int		sumBytes = width * height * 2;
	int		sumBytes = width * height;

	for (int i = 0, j = 0; i < sumBytes; i += 1, j += 3) {
		//*(PPM888buffer + j) = (*(PPM565buffer + i) >> 3) & 0X1F;
		//*(PPM888buffer + j + 1) = (((*(PPM565buffer + i) & 0X07) << 3) & 0X38) | ((*(PPM565buffer + i + 1) >> 5) & 0X07);
		//*(PPM888buffer + j + 1) = ((*(PPM565buffer + i) & 0X07) << 3) | (*(PPM565buffer + i + 1) >> 5);
		//*(PPM888buffer + j + 2) = *(PPM565buffer + i + 1) & 0X1F;
		//*(PPM888buffer + j) <<= 2;
		//*(PPM888buffer + j + 1) <<= 1;
		//*(PPM888buffer + j + 2) <<= 2;


		//*(PPM888buffer + j) = (*(PPM565buffer + i)) & 0X1F;
		//*(PPM888buffer + j + 1) = (((*(PPM565buffer + i + 1)) << 3) & 0X38) + ((*(PPM565buffer + i) >> 5) & 0X07);
		//*(PPM888buffer + j + 2) = (*(PPM565buffer + i + 1) >> 3) & 0X1F;

		//unsigned char	red = (buf & 0xf800) >> 11;
		//unsigned char	green = (buf & 0x07e0) >> 5;
		//unsigned char	blue = buf & 0x001f;

		//unsigned char	b = (((aTextel) & 0x001F) << 3);
		//unsigned char	g = (((aTextel) & 0x07E0) >> 2);
		//not 0x03E0
			// unsigned char r = (((aTextel) & 0xF800) >> 8);
		//not 0x7C00, >>7
			// return qRgb(r, g, b, 255);


		*(PPM888buffer + j) = ((*((unsigned short *)PPM565buffer + i)) & 0xf800) >> 11;
		*(PPM888buffer + j + 1) = ((*((unsigned short *)PPM565buffer + i)) & 0x07e0) >> 5;
		*(PPM888buffer + j + 2) = *((unsigned short *)PPM565buffer + i) & 0x001f;


		//*(PPM888buffer + j) <<= 3;
		//*(PPM888buffer + j + 1) <<= 2;
		//*(PPM888buffer + j + 2) <<= 3;
		*(PPM888buffer + j) *= 8;
		*(PPM888buffer + j + 1) *= 4;
		*(PPM888buffer + j + 2) *= 8;

	}
}

+(void)convertPPM565:(unsigned char *)
	PPM565buffer	toPPM888:(unsigned char *)
	PPM888buffer	width:(int)
	width		height:  (int)height
{

	int		sum2Bytes = width * height;
	unsigned char  *temp8 = PPM888buffer;
	unsigned short *temp565 = (unsigned short *)PPM565buffer;

	for (int i = 0; i < sum2Bytes; i++) {

		//&的优先级高于<<，优先级处理加括号
		//565到888转换要对应扩大大约8，4，8倍
		*temp8++ = (*temp565 & 0xf800) >> 8;
		*temp8++ = (*temp565 & 0x07e0) >> 3;
		*temp8++ = (*temp565 & 0x001f) << 3;

		temp565++;
	}
}
