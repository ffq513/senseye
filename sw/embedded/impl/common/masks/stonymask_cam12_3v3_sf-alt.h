const unsigned char stonymask[112*112]={12,13,13,12,11,15,13,16,13,10,14,13,13,11,12,11,9,12,11,12,11,9,11,8,12,10,10,14,9,10,12,12,10,14,15,13,9,11,11,12,10,11,9,13,9,12,10,10,11,11,12,12,10,13,10,10,12,12,12,13,12,7,12,12,9,13,13,10,11,12,9,12,11,11,10,13,12,12,12,12,12,13,13,12,9,13,15,14,14,13,11,15,14,10,12,14,13,13,12,12,8,13,12,12,14,15,14,11,12,9,12,10,8,9,8,4,10,11,7,8,7,9,10,10,11,10,8,8,6,9,9,9,11,7,10,7,9,9,7,8,7,6,9,10,7,8,10,8,8,6,10,10,8,7,10,7,5,9,5,7,9,4,7,12,11,8,10,8,7,9,8,11,9,9,10,5,9,10,7,8,9,11,9,10,12,7,9,10,8,10,5,7,9,10,8,8,7,8,9,10,8,9,7,10,11,6,7,10,9,9,9,7,10,10,7,10,6,8,11,7,8,11,11,11,11,7,8,11,13,11,9,10,10,8,12,10,12,9,12,13,7,10,8,14,8,10,9,7,7,8,7,10,11,8,7,10,8,13,12,10,9,9,8,10,9,9,8,10,9,10,11,9,11,6,10,13,10,11,7,10,8,8,12,5,8,9,9,9,12,12,7,8,8,9,11,11,11,10,10,7,8,8,13,9,10,10,11,12,10,9,11,12,9,10,10,11,5,10,5,8,10,12,9,10,10,7,8,10,6,12,12,10,13,12,12,12,11,12,8,12,10,14,10,11,11,12,14,9,10,8,8,12,9,8,8,12,9,10,10,8,8,11,6,13,10,7,8,11,10,10,11,8,7,8,11,11,11,7,9,11,9,12,10,12,7,9,9,14,11,8,10,7,7,11,9,10,8,10,9,9,9,12,7,11,10,9,12,11,10,9,9,12,14,10,8,10,12,12,8,11,11,10,13,13,12,10,8,11,9,8,7,8,11,11,11,9,12,10,6,8,9,11,11,10,9,10,13,7,11,10,10,9,10,13,8,11,8,12,13,13,12,12,12,11,8,11,11,11,7,8,11,10,12,9,9,12,8,6,9,13,9,12,9,10,9,10,12,8,6,10,11,9,9,10,10,11,9,6,9,11,9,8,9,7,10,9,9,13,10,9,9,7,9,12,9,10,6,11,10,7,12,10,9,14,10,9,11,9,11,10,8,11,10,9,9,11,8,11,7,11,12,9,7,9,9,9,9,10,11,11,8,7,9,10,7,9,8,5,12,10,7,8,10,3,10,8,6,8,5,7,8,9,5,6,10,11,9,9,7,10,11,10,7,7,7,8,6,8,9,8,10,7,9,8,4,10,11,5,7,6,7,7,5,12,11,9,9,6,12,6,10,6,8,10,8,9,11,9,6,9,8,10,10,7,10,8,10,9,8,6,7,6,8,10,6,8,10,9,7,8,8,7,10,4,6,6,10,10,10,9,7,11,7,9,6,10,11,6,8,7,10,8,5,8,9,9,10,8,6,6,9,9,10,11,5,11,6,11,7,10,11,12,13,10,11,12,11,9,7,9,7,12,9,9,10,7,14,7,7,9,10,10,11,8,11,6,9,10,9,12,10,11,8,7,10,11,9,10,11,10,13,8,9,11,12,3,9,8,11,11,9,10,10,14,12,8,11,12,11,9,8,10,9,9,10,9,8,6,7,9,10,11,10,11,11,10,9,11,10,10,9,10,10,11,11,12,9,10,9,11,8,8,13,8,9,10,9,10,12,6,9,10,7,12,12,10,7,10,13,12,11,9,11,11,10,9,11,7,12,12,8,11,10,11,10,11,10,7,9,11,8,11,9,6,9,10,10,13,10,14,9,9,13,9,8,8,9,9,7,10,9,9,11,9,10,14,9,10,9,10,12,11,10,14,8,8,10,8,12,12,11,11,11,10,13,12,12,10,9,12,11,8,8,10,6,8,11,11,5,8,13,12,12,10,8,11,12,10,10,8,8,8,8,13,9,11,10,6,7,10,11,8,8,10,9,13,11,11,10,12,9,13,9,7,10,11,10,9,12,9,10,12,7,11,8,10,13,10,8,8,12,9,6,10,10,10,9,9,12,13,10,13,12,10,11,10,10,10,9,10,11,8,10,9,12,6,7,12,9,10,9,8,8,10,8,6,7,8,11,8,9,10,9,8,9,8,6,10,7,10,9,11,9,9,10,12,10,9,11,9,10,9,10,7,11,9,6,13,9,7,8,8,12,9,9,10,10,10,10,11,9,8,14,11,9,9,9,11,9,11,8,8,10,12,9,9,6,10,14,6,7,6,11,10,8,10,6,10,10,8,11,4,9,6,8,8,10,9,6,7,6,14,7,9,9,4,11,8,11,9,7,8,6,9,7,7,10,5,10,11,9,6,9,10,5,11,5,8,8,9,10,9,9,12,10,7,5,7,9,7,10,5,6,6,10,8,8,8,10,10,7,11,7,8,10,11,10,7,9,13,10,6,6,8,9,8,9,10,7,10,8,10,8,11,8,11,8,9,8,9,11,11,10,10,12,11,7,7,8,7,8,8,7,9,9,12,11,9,6,12,10,9,13,10,10,8,8,8,12,9,10,9,10,10,8,11,9,13,8,10,8,10,7,8,10,10,9,10,11,8,6,9,10,10,6,10,8,6,10,10,8,11,7,8,9,6,9,10,9,9,8,10,8,9,7,12,9,10,9,12,11,10,6,10,10,7,12,9,12,9,8,14,8,9,6,9,6,11,7,8,9,12,10,9,11,11,10,11,8,9,8,11,9,9,10,11,12,14,11,9,7,11,10,12,9,10,10,11,4,11,8,11,11,11,11,9,9,10,9,9,11,11,4,11,12,11,10,11,7,10,10,10,10,9,8,12,10,10,10,8,12,7,5,13,11,10,9,8,12,11,8,12,9,10,10,9,10,11,9,11,9,8,12,8,11,9,9,11,10,10,9,9,10,10,8,11,9,10,12,7,11,8,8,10,9,12,9,10,10,9,11,7,11,11,9,10,9,10,8,11,10,11,11,10,11,13,12,8,7,9,8,6,9,12,12,7,9,8,10,13,7,8,7,13,13,8,11,10,11,9,9,10,9,8,8,9,8,9,10,12,7,10,10,9,11,9,9,8,8,10,9,8,10,11,7,12,11,9,8,9,11,10,9,10,11,11,13,10,7,10,11,10,11,8,9,11,12,6,8,9,9,11,8,8,10,9,9,9,9,11,12,12,10,9,11,12,9,9,8,10,12,11,5,7,9,10,9,9,7,8,11,9,9,10,10,13,6,6,10,10,10,11,9,7,9,8,7,7,11,8,9,11,9,11,7,10,8,6,11,9,8,7,9,11,11,10,10,8,9,10,11,12,8,7,10,10,9,9,8,8,5,9,10,7,10,7,8,9,8,10,9,11,9,12,9,10,7,9,7,10,7,9,9,3,8,10,5,7,10,12,8,9,12,9,8,9,9,9,9,9,9,5,10,9,7,6,6,11,10,6,4,7,9,8,8,7,8,9,9,11,9,8,6,5,6,7,7,9,7,10,10,8,12,14,9,10,11,9,8,5,11,10,8,10,11,11,10,11,8,9,7,11,10,7,8,7,9,10,10,10,9,9,8,12,7,9,11,9,7,6,9,7,7,6,6,7,10,5,10,10,9,9,7,9,12,11,9,7,9,7,8,9,9,11,12,9,6,8,10,12,10,10,5,10,10,9,10,7,10,10,8,7,8,9,9,9,11,9,9,9,8,9,6,9,8,10,9,5,13,12,9,9,10,9,10,5,8,5,9,10,9,9,7,9,12,11,8,10,11,11,12,10,9,11,9,9,9,9,8,11,9,9,13,10,10,10,10,10,12,13,12,12,10,12,11,11,9,11,9,11,7,7,10,11,6,12,11,11,9,6,11,12,11,9,9,10,8,9,7,10,9,9,11,9,7,8,11,8,10,8,7,8,10,8,6,7,10,9,10,8,9,10,9,9,10,7,11,11,13,7,7,11,11,9,9,6,7,10,8,10,9,9,6,8,11,10,11,9,10,8,11,12,7,10,10,9,9,11,9,12,12,7,11,8,9,11,10,12,6,9,7,8,11,7,12,7,7,10,8,13,10,7,6,8,7,13,8,11,9,12,10,9,11,7,10,8,9,10,10,9,9,8,10,11,9,11,5,9,9,9,8,11,11,7,12,7,10,10,6,9,9,7,8,10,9,10,8,9,13,8,10,9,11,9,9,11,7,9,12,11,10,8,9,11,9,7,9,10,9,10,7,9,11,10,7,9,12,12,10,9,10,7,8,9,9,8,10,5,9,10,6,9,10,5,12,8,9,7,9,11,9,10,7,11,7,7,10,7,10,8,7,7,9,9,8,9,8,9,7,7,9,8,11,11,8,8,11,9,7,10,8,10,12,7,7,12,8,8,9,11,9,8,11,12,7,10,10,9,9,6,9,6,10,4,8,9,8,9,8,10,11,10,6,10,7,10,7,11,10,8,7,11,8,7,11,8,8,6,9,9,8,9,7,9,9,7,8,8,9,8,8,7,5,9,9,6,10,10,8,11,10,12,8,8,10,9,10,7,9,11,13,11,7,9,8,10,6,8,9,7,12,9,11,8,8,8,11,8,10,8,9,8,8,9,10,11,12,9,10,12,8,9,9,7,8,8,9,12,8,10,9,7,6,11,9,9,7,7,8,7,6,10,10,9,8,8,7,8,7,6,7,13,9,8,8,12,9,10,8,8,5,8,6,10,9,8,9,8,9,10,10,10,8,10,8,8,8,7,7,6,9,10,9,9,6,8,10,12,9,9,7,9,10,11,9,9,10,8,11,8,8,11,9,12,7,9,10,10,9,7,11,9,12,10,8,13,11,11,8,8,9,12,10,8,9,8,9,8,9,10,7,9,9,11,12,12,10,10,9,7,11,11,11,11,11,12,7,11,10,8,9,7,8,12,11,10,8,6,9,10,11,11,9,9,10,12,10,6,9,10,6,12,11,11,9,10,10,6,7,12,8,11,6,8,8,10,8,8,11,7,7,9,9,8,12,8,8,7,9,9,8,9,9,11,9,12,11,8,9,10,12,10,10,13,7,13,8,10,8,8,10,9,12,6,10,8,9,8,11,7,10,10,13,15,12,12,8,10,8,9,10,10,9,13,8,10,9,12,11,10,11,14,12,10,7,8,11,8,5,12,13,8,6,8,10,10,11,8,6,9,11,11,10,14,9,10,10,10,7,10,8,11,10,10,10,9,11,12,9,11,10,11,10,9,9,10,9,9,7,8,9,9,7,10,9,9,13,11,9,10,6,13,7,10,6,9,9,13,6,11,10,6,10,10,11,13,9,11,7,10,8,7,9,8,11,7,9,9,7,11,9,9,7,7,14,8,10,11,8,11,10,10,11,6,9,9,11,11,4,9,8,4,10,10,10,7,9,8,7,9,9,11,11,8,7,11,9,11,9,11,7,5,9,11,7,7,7,8,8,9,8,4,8,8,7,6,9,9,12,7,9,7,9,6,12,7,7,9,8,11,8,7,9,11,6,9,10,8,9,7,6,7,11,13,12,9,11,11,11,9,10,9,10,8,10,6,9,9,9,10,8,11,6,9,9,8,8,4,9,11,10,13,8,7,8,10,12,12,12,11,5,8,8,9,9,8,8,10,7,8,7,9,13,8,7,9,7,9,8,10,6,6,11,9,5,8,4,7,8,13,5,9,7,8,8,10,8,11,6,9,9,9,9,11,8,7,10,10,5,9,11,7,6,7,7,12,7,9,6,5,7,6,7,7,7,8,4,7,10,6,10,7,8,7,10,10,7,10,9,11,9,13,8,12,8,9,12,9,9,9,11,14,8,7,8,8,8,11,11,7,8,11,12,12,10,10,9,7,13,10,9,12,7,9,8,9,10,7,10,6,10,11,7,10,11,9,9,12,11,11,10,9,7,11,8,11,9,10,9,7,8,9,6,11,9,9,11,10,11,12,10,13,5,8,12,7,7,9,9,9,9,8,10,8,9,8,7,9,12,7,7,10,9,9,7,7,12,7,6,9,12,10,11,8,10,7,8,10,10,11,8,9,8,11,11,11,11,11,10,8,11,7,9,12,7,11,5,9,8,10,11,10,10,8,8,9,8,8,7,10,10,13,12,11,7,9,10,10,10,12,10,11,11,9,11,9,10,8,10,12,13,6,7,13,11,9,9,12,7,6,7,8,9,12,10,10,9,9,10,8,7,10,12,10,7,10,7,8,8,10,7,9,8,8,13,8,9,11,8,9,7,11,11,11,9,8,11,12,9,10,10,13,8,12,9,10,8,8,10,9,7,11,10,12,7,9,11,12,10,8,8,7,8,9,9,12,10,10,6,9,9,12,8,8,10,9,7,6,8,9,10,8,12,8,11,8,8,7,7,9,10,9,7,13,9,11,8,10,11,9,10,7,7,10,8,10,11,11,6,10,9,7,10,9,8,12,10,8,7,8,7,8,7,9,7,10,9,7,8,9,9,12,7,6,7,9,12,8,10,8,7,9,7,8,9,6,11,6,8,7,8,6,7,10,6,9,8,8,9,7,10,11,7,9,10,9,8,11,8,8,7,8,13,6,7,8,10,8,6,5,8,8,8,10,11,8,8,8,6,11,11,10,11,7,9,9,9,10,8,11,9,11,3,7,8,10,9,10,11,8,8,6,10,8,10,8,9,10,6,8,11,7,9,7,9,4,6,12,8,11,11,9,5,7,10,9,7,10,9,8,5,10,10,7,11,8,6,7,8,6,10,8,9,10,7,7,9,8,11,9,8,4,6,8,9,11,10,9,11,9,8,8,7,9,10,12,8,12,7,11,11,11,7,8,10,8,11,9,9,9,10,10,10,9,9,11,8,9,12,11,10,13,11,10,8,12,11,15,10,10,9,10,9,10,10,8,10,10,9,10,11,10,11,8,8,12,8,13,7,7,11,11,9,10,8,8,9,9,11,14,10,7,3,8,8,9,10,10,8,12,10,11,8,10,9,9,10,14,7,8,15,8,12,6,7,14,7,8,7,9,9,5,9,9,11,8,9,11,9,8,7,10,10,10,9,13,9,10,8,10,12,12,11,8,9,11,14,10,11,9,10,11,11,8,9,11,10,11,11,9,6,9,9,10,8,10,13,10,10,9,10,10,8,9,8,9,8,9,8,10,10,8,9,11,10,7,10,10,11,13,12,10,9,10,9,10,8,10,11,7,7,14,11,9,10,11,9,8,12,9,7,8,7,9,10,9,9,9,13,11,9,9,10,11,9,11,10,12,8,10,8,9,7,9,8,8,11,10,9,10,10,11,10,11,7,9,12,11,9,9,8,9,9,11,7,7,7,7,10,8,11,10,6,9,2,11,11,13,9,8,12,10,9,9,5,10,9,8,8,5,12,11,8,11,8,9,11,9,9,6,9,12,9,9,7,8,9,6,5,11,8,10,5,10,12,7,8,4,10,7,10,8,9,12,8,9,7,7,5,9,12,11,6,7,6,8,9,9,8,9,9,7,7,7,11,8,11,7,8,11,9,10,10,7,9,8,5,6,7,7,11,10,11,10,8,7,9,10,10,11,8,10,8,9,8,10,11,7,6,8,11,8,5,9,5,9,8,8,8,11,9,9,9,7,10,9,7,10,10,8,6,9,11,9,12,9,7,8,8,11,11,5,8,8,9,10,8,10,11,3,10,10,7,9,9,8,9,8,11,10,7,9,9,8,9,8,8,9,8,6,7,11,6,8,7,10,6,6,8,9,5,7,10,9,9,6,13,12,11,3,6,8,9,8,9,8,8,7,10,8,7,8,5,5,8,7,8,6,9,7,8,7,9,12,9,11,10,11,6,6,11,7,12,7,9,11,9,12,11,8,8,10,11,7,12,10,10,10,10,9,8,8,9,10,9,11,9,9,9,8,12,8,8,8,10,11,8,7,8,8,10,8,10,12,11,8,9,9,9,11,9,8,10,13,11,11,9,10,11,5,9,9,7,13,9,10,6,5,9,10,9,9,9,11,12,11,9,7,10,12,12,7,7,10,8,8,8,9,11,8,9,12,11,8,9,10,8,7,6,9,11,10,11,11,10,11,7,11,12,12,9,9,9,8,13,8,11,10,8,10,9,9,9,9,13,9,9,8,9,10,10,13,11,7,8,10,12,11,8,9,10,12,9,10,10,10,11,8,6,11,10,10,10,10,10,11,10,12,8,9,8,7,9,14,5,10,10,7,8,9,11,11,8,9,11,11,13,11,4,10,11,11,11,10,9,10,13,11,8,10,11,12,11,9,9,10,10,7,10,10,11,8,9,9,12,9,12,9,9,11,7,8,9,11,12,12,7,10,9,7,11,14,5,9,8,8,10,9,6,8,9,14,10,9,7,11,11,5,9,5,9,9,10,11,10,6,7,8,10,13,8,11,10,11,10,8,7,6,9,10,8,8,9,11,10,11,10,9,7,8,8,8,9,10,9,9,7,9,8,8,7,10,11,9,9,7,8,8,8,11,6,10,8,9,9,12,11,9,9,11,6,9,11,11,12,5,7,10,9,7,8,10,10,8,7,7,9,9,9,9,9,9,8,6,7,9,9,10,6,6,7,10,10,8,10,8,10,9,8,9,7,11,8,11,6,7,10,12,7,9,8,5,6,8,7,12,10,6,7,11,11,14,7,7,8,6,7,11,8,5,4,8,9,11,6,8,11,6,9,9,9,6,12,9,10,8,10,10,10,9,9,9,10,13,7,9,5,5,8,9,12,12,4,12,8,7,7,9,11,8,9,10,7,6,12,7,11,7,8,9,8,8,8,5,8,7,8,9,9,9,8,7,4,10,9,9,7,6,9,13,8,10,10,8,6,12,9,8,10,9,12,8,8,14,6,9,9,11,11,13,9,5,13,9,10,8,6,9,7,9,11,11,10,9,4,9,7,9,7,9,9,7,9,12,9,9,9,11,10,8,11,14,10,11,8,9,11,10,10,11,7,9,9,11,10,12,9,11,9,10,8,10,9,9,6,12,10,11,12,8,13,9,12,13,7,10,11,7,14,8,6,10,9,7,7,8,6,5,8,11,9,11,8,6,11,10,11,8,7,9,12,10,11,11,10,10,11,13,13,12,10,12,8,11,9,11,9,9,9,9,9,12,7,11,11,5,9,9,9,13,9,8,9,9,11,13,6,11,8,8,13,12,8,9,11,13,12,9,10,11,11,8,11,10,11,9,10,7,8,8,8,10,7,11,11,7,9,10,9,9,9,9,10,12,8,11,7,11,9,10,8,9,10,11,12,10,7,9,15,7,9,11,7,11,11,7,8,11,8,8,9,11,10,6,8,9,9,9,9,6,6,8,10,11,9,11,9,12,10,13,10,10,10,7,9,9,10,9,9,10,8,8,9,12,10,9,9,7,8,8,9,11,8,11,8,12,10,14,6,11,7,8,11,10,9,8,11,10,10,9,12,11,10,7,10,8,7,9,8,9,12,11,8,8,9,8,11,9,11,7,8,12,9,9,10,10,11,7,8,9,11,9,8,7,9,9,7,11,5,8,10,8,11,6,6,10,9,6,6,9,9,9,10,7,10,9,5,8,7,9,12,9,7,7,11,13,8,10,5,10,10,10,9,6,9,4,10,10,6,8,13,11,10,6,7,8,8,9,6,9,9,7,7,9,7,7,8,6,9,10,8,7,7,5,8,9,8,8,9,7,8,8,5,8,8,6,7,7,9,8,10,5,7,9,5,9,7,8,5,5,9,11,9,10,8,7,5,8,9,8,5,9,9,9,5,6,11,10,8,10,7,6,8,11,11,9,5,9,8,8,9,8,11,9,4,5,8,8,5,7,5,11,8,9,7,6,7,9,8,11,8,10,8,11,9,11,10,9,8,8,8,10,10,12,6,8,9,12,10,10,10,8,11,7,6,11,6,8,10,8,11,10,6,10,10,9,6,10,10,7,9,13,9,9,11,12,10,9,9,12,9,9,6,8,11,9,8,8,9,9,8,10,12,10,9,8,9,10,10,12,12,9,7,8,5,9,10,4,8,10,11,8,7,8,10,12,10,9,7,7,12,10,7,7,7,7,9,8,10,7,8,9,10,9,10,7,6,7,7,9,9,11,8,12,10,13,5,11,8,11,11,9,10,9,11,14,10,11,10,13,8,9,10,10,10,9,10,11,10,10,10,10,11,12,10,11,9,9,11,9,9,9,8,9,8,8,10,11,8,8,7,10,14,10,6,10,8,12,6,10,10,9,10,10,10,13,13,10,12,9,10,10,9,11,9,11,11,11,8,10,12,12,10,12,8,9,13,13,10,6,11,13,10,9,8,10,9,10,6,8,7,9,6,7,10,12,12,10,9,8,11,11,8,9,10,10,12,12,6,9,9,7,12,8,4,10,12,12,10,10,6,11,12,10,12,9,10,9,7,8,6,9,10,10,10,10,10,10,9,8,9,11,11,7,9,13,11,9,13,6,9,8,7,12,12,8,10,11,8,12,10,11,9,7,9,10,9,12,8,9,9,10,10,7,12,10,6,13,11,10,8,7,12,9,10,10,6,8,11,6,14,9,7,13,8,8,6,9,7,6,9,7,11,8,10,9,9,11,10,10,6,8,11,11,7,5,7,8,10,12,6,10,8,7,9,10,9,11,10,10,5,7,5,8,7,10,5,5,10,6,6,9,8,4,8,10,10,12,9,7,7,7,7,9,10,7,8,5,10,8,8,10,8,8,9,12,8,9,8,9,7,8,5,10,9,8,9,7,10,8,7,12,6,7,9,8,8,6,8,5,7,10,5,6,9,7,11,8,8,7,8,7,11,4,4,12,5,7,5,8,7,5,9,8,7,9,9,11,12,7,11,10,8,9,9,7,9,11,9,11,12,11,10,8,11,7,9,9,8,11,12,12,7,8,10,10,9,6,10,9,9,9,10,9,8,10,6,12,11,10,10,11,5,9,9,6,6,4,6,10,5,8,11,12,12,10,7,10,8,8,8,10,8,12,5,8,9,9,8,12,8,12,9,11,6,11,5,8,9,9,5,6,9,11,10,6,11,8,10,11,12,10,8,7,12,10,7,11,5,7,10,8,7,5,7,9,7,6,8,9,8,10,11,9,10,11,9,7,11,9,7,10,7,12,12,11,13,11,10,12,10,13,9,10,9,12,9,12,8,11,11,9,9,11,6,11,11,7,9,10,11,11,10,12,8,9,8,12,9,7,7,11,10,11,8,9,12,8,9,10,8,9,9,9,13,8,10,11,7,10,7,8,11,11,8,10,8,9,9,10,11,10,10,10,11,11,8,12,13,11,8,10,7,10,7,11,11,10,8,11,11,9,8,8,7,10,10,13,8,11,8,10,9,10,11,8,8,9,10,11,12,9,9,6,11,8,10,10,8,7,11,12,13,9,9,12,8,9,4,11,11,11,8,10,10,8,8,11,9,9,10,8,12,12,8,10,7,10,8,9,8,10,7,13,9,9,8,9,7,9,11,13,10,7,8,10,10,12,9,8,9,10,11,10,12,10,7,8,10,8,11,9,10,6,4,9,8,13,9,9,11,11,10,10,11,9,10,9,13,8,8,13,8,10,6,8,11,12,9,9,11,10,10,11,10,9,10,9,9,9,10,11,6,10,7,9,11,12,10,9,5,5,10,7,8,10,7,10,7,12,4,8,9,11,7,6,9,10,7,7,5,9,6,10,6,8,9,11,3,9,10,8,8,6,8,9,7,4,7,7,9,9,7,11,12,7,8,6,10,9,10,8,8,6,4,6,8,6,8,9,6,8,6,7,7,4,7,5,9,6,8,6,9,7,5,11,7,7,7,8,10,10,5,11,7,4,6,7,5,7,8,7,9,9,9,7,8,8,10,7,7,6,8,9,10,8,10,11,11,12,11,11,10,10,11,7,11,9,6,9,8,9,8,11,9,9,13,5,8,9,9,9,11,10,8,10,8,14,8,10,6,8,7,11,11,9,9,10,8,8,8,10,9,8,10,7,8,11,8,10,8,8,12,11,7,10,10,6,10,6,9,11,6,9,10,10,3,8,9,6,6,8,10,11,11,11,11,7,12,6,10,10,7,10,8,9,8,5,8,8,9,10,9,7,10,7,9,9,9,9,10,9,8,8,10,10,10,6,9,10,13,12,9,9,8,11,11,9,10,10,8,11,10,8,8,10,8,10,11,8,12,10,11,12,9,10,12,10,14,12,11,8,4,10,12,7,8,10,10,10,9,8,8,10,9,11,10,10,11,10,11,10,8,12,8,10,10,10,12,8,8,13,7,7,6,11,10,10,9,11,3,9,8,9,8,8,7,10,6,9,9,7,10,9,10,10,9,7,10,9,7,7,8,11,10,11,7,7,7,8,9,11,9,8,5,8,11,12,8,8,7,8,9,12,10,7,11,10,11,7,12,9,8,12,6,11,6,11,9,8,11,8,12,11,10,13,8,11,6,8,11,11,10,11,7,8,9,11,8,10,13,8,10,10,11,7,10,6,8,14,10,9,9,7,11,9,8,13,6,9,8,9,8,10,10,10,8,10,11,12,13,10,8,11,7,11,10,12,8,10,8,8,8,6,12,5,11,8,7,11,10,8,7,9,8,9,4,9,8,11,8,12,10,10,9,7,6,8,9,12,6,7,7,8,5,11,11,8,9,8,12,7,10,12,6,9,7,13,7,12,7,9,8,5,9,11,10,12,6,7,7,10,9,10,12,7,7,10,6,9,9,9,9,9,9,7,8,8,8,9,7,10,6,8,12,10,7,9,9,11,5,6,7,9,8,11,6,9,4,9,7,9,7,10,7,10,7,10,7,9,5,7,7,7,6,8,8,6,11,8,6,9,7,7,5,7,9,5,5,8,10,7,6,9,10,8,9,6,7,8,8,12,7,11,7,7,10,11,9,9,10,9,9,9,9,10,8,12,11,10,8,14,8,11,8,8,10,8,11,10,9,8,7,11,10,12,8,8,5,7,8,11,12,7,8,7,8,5,8,10,11,5,7,6,9,11,8,12,10,12,7,11,10,6,8,7,8,11,8,8,7,7,8,10,12,10,8,11,8,11,7,5,9,9,8,9,8,6,11,12,10,11,7,12,9,8,9,10,7,7,7,11,11,11,11,10,9,9,8,6,6,5,1,9,11,11,8,14,12,15,8,7,9,10,11,9,10,10,9,12,12,11,8,12,5,10,13,7,8,12,9,11,9,8,10,10,11,11,11,10,7,10,8,10,10,8,11,11,8,11,9,8,12,6,10,10,10,11,8,8,9,10,7,11,9,10,9,8,10,7,7,11,10,10,9,10,11,10,10,13,8,10,9,11,12,10,10,11,8,7,11,10,13,4,10,9,11,7,9,7,7,9,10,10,8,8,10,10,7,12,11,9,10,11,10,11,12,11,9,9,11,12,9,10,9,10,13,8,8,11,8,13,11,10,9,12,12,9,13,9,11,11,11,12,10,10,7,11,14,10,11,11,9,12,12,9,9,6,10,10,8,9,10,11,10,8,5,10,7,9,9,9,11,7,9,10,8,7,10,9,10,13,11,12,7,9,9,9,10,9,8,11,12,9,7,8,9,10,12,10,6,7,11,9,12,9,8,9,10,8,10,8,9,11,11,9,11,10,10,6,10,9,9,8,7,10,10,9,10,9,8,8,10,11,9,10,8,10,11,9,10,10,8,13,4,8,7,10,8,7,9,8,8,12,7,7,8,9,9,11,10,11,10,10,7,7,9,8,7,7,5,10,7,9,6,12,10,7,8,9,5,8,7,8,10,8,6,8,5,9,9,7,9,7,3,10,5,6,8,6,10,11,8,9,5,11,8,7,8,8,9,10,8,7,5,8,6,10,8,12,6,5,7,6,8,9,8,6,7,12,9,9,7,9,12,5,7,10,7,9,9,11,8,9,10,11,8,6,9,12,11,5,10,10,9,12,10,12,7,13,10,9,13,7,7,11,9,11,9,7,8,10,13,11,9,7,8,5,8,9,10,8,13,9,11,8,8,8,10,7,6,8,9,10,9,10,12,9,8,10,10,6,9,7,9,9,8,9,9,7,8,8,7,9,10,8,8,10,9,6,8,9,7,9,8,7,10,13,11,8,6,10,10,9,6,8,8,10,9,7,7,8,10,9,10,13,11,9,7,7,13,10,6,9,8,10,12,12,8,9,12,10,11,8,11,11,11,12,10,11,7,10,9,7,9,7,7,7,7,11,10,5,10,14,12,15,10,11,8,9,8,12,12,11,9,13,10,9,9,7,11,8,9,9,10,8,10,7,8,12,8,11,9,6,11,8,9,9,11,11,9,9,8,11,10,10,8,11,5,9,12,9,8,8,9,9,6,8,11,12,10,9,9,11,11,10,8,10,6,7,9,11,9,10,10,9,9,10,11,6,10,10,7,10,8,10,9,11,13,9,9,9,10,11,11,7,14,8,11,13,9,10,8,9,10,11,10,5,10,15,7,10,10,10,8,8,12,13,8,9,10,9,11,8,11,10,9,10,10,9,6,9,9,8,10,8,11,9,9,10,11,8,10,12,11,6,11,10,9,10,9,10,12,9,10,10,9,9,6,10,7,7,8,7,12,12,9,9,7,9,10,11,10,11,8,8,10,9,8,8,7,10,8,9,10,11,9,11,9,8,11,9,10,5,13,7,8,13,9,9,7,9,8,10,8,8,11,8,11,10,9,8,10,9,7,9,10,10,11,8,8,8,7,7,9,7,8,10,11,4,9,10,5,9,8,11,5,8,9,6,9,9,7,7,9,7,8,8,12,8,5,8,9,8,7,8,10,6,10,7,7,13,7,8,10,9,9,10,7,7,7,11,7,8,10,8,7,9,9,8,9,4,10,9,7,9,9,10,7,7,9,9,10,8,9,9,9,9,11,9,7,8,8,6,9,7,7,10,5,10,6,12,9,11,9,10,10,8,9,10,7,11,9,7,9,10,6,10,9,9,10,9,9,8,10,8,9,9,10,10,13,10,4,10,5,7,9,10,9,9,9,7,9,8,8,10,10,7,8,8,12,10,8,8,7,11,9,10,8,7,10,6,6,11,6,9,11,7,9,7,8,11,8,10,10,7,6,8,10,13,7,10,6,7,11,9,13,8,8,7,9,7,9,8,9,9,11,9,8,11,6,10,5,11,10,9,7,8,11,10,10,11,6,12,10,10,11,10,11,8,10,7,9,8,10,14,12,11,7,11,10,7,13,8,9,12,10,11,9,10,8,12,13,11,8,13,9,8,9,11,8,11,6,12,8,10,10,9,14,9,7,10,11,11,8,9,10,13,12,10,9,6,9,9,10,14,8,7,11,9,10,11,11,8,8,9,8,10,11,9,9,10,12,10,6,10,15,9,13,11,7,10,9,9,8,7,9,9,8,8,10,11,9,9,10,12,10,9,11,10,9,9,7,11,8,7,9,13,10,8,11,9,10,10,11,10,9,11,6,11,10,10,9,10,11,8,10,9,10,10,9,9,7,8,12,11,12,9,9,11,9,11,11,8,11,8,10,10,8,9,10,7,11,10,12,7,6,8,9,11,7,11,8,7,8,8,7,10,6,9,9,10,8,12,12,7,10,11,7,9,7,9,11,10,10,12,10,8,10,8,10,10,10,12,10,8,10,9,10,10,8,11,12,12,10,9,11,10,9,8,9,10,8,10,8,9,8,10,8,8,7,7,9,12,11,12,9,11,9,8,10,9,8,12,11,7,8,6,8,11,8,9,7,11,5,8,11,8,7,10,10,7,7,8,10,11,9,9,9,7,8,10,11,8,10,11,8,10,5,5,9,9,7,11,11,9,9,4,7,9,10,9,7,8,8,9,10,9,8,13,8,5,8,8,9,8,11,7,7,7,10,10,10,7,5,10,9,9,7,6,7,8,9,5,9,10,5,7,13,11,9,7,7,5,8,11,10,8,9,9,10,15,6,8,7,5,10,8,10,10,11,8,8,9,9,13,7,9,9,8,10,10,7,10,8,11,7,9,10,11,8,10,8,7,12,13,7,4,7,10,7,10,8,8,12,7,8,8,9,9,8,7,7,7,6,8,5,8,12,9,9,10,9,9,9,5,7,11,8,9,7,9,10,7,6,6,8,7,10,11,9,6,11,10,11,8,5,10,8,7,8,9,8,5,9,6,8,10,7,6,6,11,12,9,4,9,9,10,10,10,8,11,10,12,11,10,11,9,11,7,8,13,10,10,9,9,10,11,7,10,14,9,13,11,10,10,9,6,11,9,12,9,6,14,8,12,10,12,8,10,9,12,9,8,7,6,12,10,7,11,9,7,7,8,13,12,10,10,9,9,10,8,9,13,9,8,7,9,7,9,11,10,8,11,9,10,10,8,7,9,9,10,9,7,12,10,11,5,6,8,6,8,12,9,8,8,10,9,7,9,11,11,7,9,12,10,7,8,12,11,8,10,6,9,12,11,10,10,12,12,11,10,9,10,11,12,12,11,6,11,12,11,9,9,11,8,7,9,10,9,8,9,9,12,9,10,7,8,10,9,8,8,9,10,8,8,8,10,10,11,10,13,10,8,8,8,9,11,10,9,9,11,12,7,9,14,8,7,9,7,8,11,8,6,7,12,9,10,9,6,11,10,9,11,8,9,12,10,11,8,7,11,8,8,9,8,7,12,9,9,10,11,8,9,11,11,11,11,9,9,12,11,10,8,8,8,8,11,5,10,9,10,13,8,8,9,10,11,10,11,6,14,10,8,10,9,11,10,11,9,9,10,8,5,11,10,8,8,9,7,10,10,7,8,10,11,11,8,4,7,11,9,11,11,12,7,7,8,10,11,8,8,8,8,10,7,11,11,10,8,7,8,5,10,7,4,6,11,8,7,9,6,7,10,11,11,9,7,10,11,8,9,8,9,8,7,7,9,6,7,3,9,6,10,9,9,7,11,11,9,10,7,7,12,10,10,8,7,11,11,6,9,9,8,11,10,10,9,7,9,8,8,9,8,6,10,11,7,8,10,7,9,12,6,8,6,8,11,10,12,9,8,10,9,7,9,9,7,5,8,7,9,9,6,7,10,6,9,9,9,8,12,10,11,9,7,7,8,8,10,6,8,5,6,8,11,9,9,4,13,10,7,8,9,10,9,9,8,8,6,10,12,7,6,9,4,8,7,6,7,8,7,7,8,7,9,8,10,5,9,8,6,9,10,12,9,9,12,7,9,10,13,11,7,12,10,9,12,11,11,8,12,7,11,9,13,15,12,15,11,11,9,10,11,8,10,12,10,11,10,10,11,8,8,9,13,9,8,8,10,8,7,8,11,10,7,9,8,7,11,8,9,9,8,8,9,7,10,10,10,8,11,11,10,10,10,7,10,12,11,9,11,10,9,6,6,8,11,9,7,7,7,11,9,7,11,8,10,9,11,6,7,7,6,9,10,8,8,8,11,6,9,10,10,11,8,12,12,7,8,8,10,7,11,9,9,8,7,9,9,13,10,12,11,11,9,8,10,11,11,10,8,9,11,11,12,10,9,10,7,12,9,10,14,8,7,11,9,10,8,5,11,9,10,7,8,11,10,9,11,10,9,10,10,10,8,10,9,10,10,9,8,13,11,8,9,5,6,7,10,11,7,7,12,14,11,9,8,10,9,8,7,7,6,9,9,11,9,7,10,9,7,8,8,8,8,9,6,9,12,9,11,12,11,9,9,10,8,14,10,9,10,6,11,9,12,10,8,6,8,10,8,12,12,9,11,8,12,7,13,7,10,13,9,7,7,5,9,7,9,8,8,12,8,7,9,9,8,8,11,9,11,9,9,8,11,10,10,8,8,10,11,10,9,8,7,9,10,9,10,7,8,9,8,9,10,9,10,7,6,9,11,7,7,8,12,8,7,8,5,9,7,7,10,11,9,9,8,9,7,10,10,8,10,9,7,9,7,6,9,10,8,10,9,9,9,12,7,9,9,11,9,7,10,9,10,7,11,8,7,7,10,10,7,11,9,7,9,9,7,9,11,8,8,7,6,9,8,9,9,8,8,8,11,9,6,11,11,8,8,9,9,5,10,8,7,4,8,9,8,13,9,10,10,10,10,5,9,6,8,8,9,9,7,11,7,10,7,9,7,9,8,5,9,9,6,6,12,11,7,8,5,8,9,8,11,9,6,11,9,9,7,5,9,10,6,5,7,10,7,7,3,9,9,8,9,9,9,10,9,7,9,8,12,11,10,7,11,10,14,8,10,12,11,11,9,9,12,10,8,10,11,6,10,10,8,10,9,10,11,8,11,11,8,5,10,10,12,10,13,6,7,11,10,10,7,9,11,8,11,8,9,12,8,8,6,7,9,10,13,8,10,12,11,10,7,10,9,12,12,11,9,7,5,10,11,11,6,8,9,9,10,9,9,9,9,7,8,9,7,9,7,10,9,4,10,7,7,8,8,11,9,8,9,8,9,10,7,7,10,10,8,6,7,7,11,10,9,9,8,9,12,9,11,9,9,15,10,11,10,10,11,11,10,7,8,10,13,12,8,11,9,9,13,10,10,10,10,10,11,10,9,9,9,11,11,8,7,10,7,7,11,8,11,13,9,11,7,11,12,9,13,10,13,11,11,6,10,10,9,6,11,7,10,11,8,10,9,13,7,8,8,10,7,6,9,11,12,10,8,10,9,9,9,13,11,11,8,10,8,7,10,8,7,11,12,6,8,10,10,13,12,11,11,7,10,12,11,10,8,6,11,7,10,9,10,10,8,12,10,9,12,9,10,9,9,7,8,12,11,10,6,7,9,9,8,9,10,8,8,10,11,10,7,8,9,11,10,8,7,8,8,10,9,6,6,8,7,9,9,13,11,11,9,6,12,10,11,9,7,8,8,11,9,8,8,10,11,8,8,11,8,7,11,11,8,8,7,10,11,9,9,12,7,10,13,10,9,6,10,10,7,7,9,10,8,7,10,6,6,10,7,6,6,15,6,7,9,7,10,4,9,9,6,8,12,8,8,4,10,11,7,7,8,9,7,8,9,10,10,7,10,10,7,6,10,9,13,9,8,9,7,12,11,9,12,5,9,8,9,8,7,9,9,8,8,8,9,11,8,11,9,5,7,8,5,10,10,10,10,9,7,6,9,7,10,9,6,7,4,7,7,7,7,4,11,9,6,7,8,8,8,9,6,8,3,9,8,9,10,8,9,7,10,3,7,4,9,8,11,7,7,8,9,8,8,9,9,6,5,10,11,11,11,11,12,11,10,9,9,9,10,12,11,10,13,11,9,11,11,7,12,9,9,12,8,9,8,11,14,10,11,11,9,11,10,10,11,8,11,11,7,9,9,11,9,9,9,12,10,12,7,9,10,9,11,5,7,9,12,8,9,9,9,10,10,9,9,11,12,10,6,10,11,13,8,9,12,8,9,8,9,6,9,8,12,9,9,11,9,7,8,8,9,8,10,9,9,7,8,9,8,8,9,11,8,9,12,7,8,11,9,12,13,11,13,8,9,11,13,8,12,10,14,12,9,10,11,9,11,10,11,10,13,11,9,11,9,8,6,7,11,12,8,11,10,14,11,11,10,9,10,7,12,13,9,10,10,7,10,7,11,11,10,9,9,11,11,10,13,7,12,10,12,9,10,10,9,10,11,9,9,10,8,7,11,11,11,10,7,7,7,10,10,11,9,10,9,12,10,12,10,14,10,9,11,10,12,13,10,11,7,8,8,13,11,10,11,9,10,12,8,9,9,12,9,9,10,6,11,8,13,7,10,7,10,13,9,9,12,10,10,4,10,8,9,7,9,7,7,9,11,7,10,11,10,4,6,9,14,7,10,7,9,11,7,9,8,8,10,8,6,9,10,11,8,8,9,11,8,8,8,10,11,9,12,8,11,12,10,8,10,7,12,9,7,8,10,11,10,7,10,8,7,8,8,8,7,9,8,8,9,11,9,12,9,9,10,10,10,7,7,8,3,8,9,13,9,10,9,8,12,9,8,6,7,14,11,9,11,12,10,10,11,9,10,10,10,11,11,8,7,6,3,9,11,8,8,4,9,10,8,10,6,10,9,9,8,8,8,12,8,11,12,7,9,7,7,7,7,6,9,7,10,8,5,9,9,9,9,11,9,6,7,8,6,7,4,6,9,6,7,7,10,8,10,7,6,8,8,5,7,5,9,11,7,5,6,7,6,8,8,5,5,10,8,9,7,6,9,6,9,10,9,6,8,10,8,8,11,9,9,9,10,11,5,9,8,12,9,9,8,10,13,9,12,9,9,9,11,13,11,13,12,9,10,12,12,5,10,9,7,12,9,6,8,9,13,7,10,9,7,11,11,6,12,5,6,11,12,10,9,7,8,7,8,9,10,10,9,11,11,9,9,11,8,8,10,9,8,8,8,10,7,11,11,8,10,10,10,8,10,11,9,9,13,9,5,9,11,8,9,11,12,8,7,12,10,10,11,9,11,8,10,8,7,8,8,9,11,10,11,9,12,10,8,13,10,8,12,10,12,11,12,10,10,12,10,13,13,9,9,12,9,9,11,11,11,9,11,9,13,12,11,12,8,9,11,9,13,12,12,9,10,11,11,9,15,6,9,9,13,10,8,8,12,11,9,11,9,12,6,8,10,10,9,7,10,11,9,9,11,7,9,9,9,11,11,9,9,9,11,9,10,9,8,8,11,10,9,8,9,13,8,8,9,10,9,13,9,10,12,8,10,8,9,9,10,9,9,9,7,12,12,7,11,10,10,12,7,9,9,9,12,11,10,9,13,11,9,8,12,9,9,10,9,9,12,9,8,9,12,11,11,8,9,9,10,9,9,6,8,8,6,10,9,12,11,10,13,6,8,9,10,9,8,11,9,9,10,7,10,10,6,11,10,11,9,7,10,8,8,10,12,8,9,9,7,8,10,7,10,7,6,9,7,8,11,11,13,11,6,8,8,7,13,9,7,8,9,8,9,10,10,6,15,10,6,9,9,10,9,8,12,7,7,8,9,11,9,11,8,9,8,12,12,8,8,9,10,7,12,9,6,10,9,11,8,9,9,9,9,9,9,8,8,12,7,8,6,9,10,9,11,6,5,10,6,10,10,7,7,7,6,9,10,8,8,6,9,6,10,10,9,8,5,6,9,9,8,5,6,5,8,9,11,8,10,8,5,8,10,7,10,7,8,8,9,10,7,7,11,9,11,9,7,8,10,9,7,4,7,10,6,11,9,7,7,7,8,7,8,8,7,10,9,8,11,8,9,7,7,11,8,7,7,9,10,10,8,12,10,9,12,7,9,9,10,13,9,11,11,11,8,10,12,9,10,8,7,12,9,9,10,7,9,8,11,8,10,10,8,10,7,4,8,10,9,11,6,9,9,8,7,8,7,10,7,12,9,11,12,10,11,10,10,7,13,6,9,10,10,11,9,9,9,10,9,9,11,12,10,7,9,7,11,9,11,9,8,12,11,9,7,13,7,9,9,10,11,8,9,6,10,9,11,7,9,11,8,8,11,8,8,10,9,7,10,10,11,10,10,7,11,8,13,11,8,9,12,13,9,10,13,9,10,10,13,10,12,11,11,8,6,11,8,9,7,13,9,11,13,15,15,10,9,8,10,11,11,9,8,9,11,10,10,10,9,10,10,9,7,8,9,10,10,7,9,7,12,11,10,9,9,8,12,10,13,8,7,10,11,10,11,7,6,7,11,11,9,11,9,13,11,10,9,13,9,10,12,9,12,8,10,7,11,10,8,13,9,10,9,10,10,9,11,9,8,4,9,11,12,7,9,9,10,12,13,11,9,8,12,12,8,8,12,11,10,11,10,9,11,11,9,13,9,9,8,6,13,9,10,10,8,11,13,7,8,5,9,9,11,11,7,7,7,9,10,8,8,12,7,8,8,10,10,10,7,10,9,9,11,9,6,7,9,9,11,6,10,8,10,8,11,9,10,7,11,7,6,7,10,9,10,11,9,7,10,15,11,12,12,10,12,10,8,10,11,7,8,7,8,9,8,11,9,9,10,10,11,8,9,9,10,8,12,9,10,7,11,9,6,10,8,11,9,9,9,8,12,7,6,8,10,9,7,12,6,7,3,8,8,7,7,7,6,9,8,8,7,7,7,6,9,9,7,5,9,9,7,9,8,9,9,6,12,9,9,5,8,9,8,5,5,6,7,8,8,5,8,8,6,9,6,7,7,8,7,9,7,7,7,9,7,9,10,10,10,9,9,11,7,12,8,7,10,9,8,6,8,8,8,8,10,10,5,7,10,9,10,9,6,7,6,6,10,9,10,7,7,9,11,8,10,10,10,10,11,9,11,13,11,7,10,7,12,10,9,12,8,8,8,8,10,7,8,9,7,9,11,9,10,8,8,7,10,8,7,9,15,10,11,9,6,10,7,9,10,8,11,7,12,6,9,8,10,10,7,10,8,10,13,7,7,11,11,8,8,10,9,8,10,6,9,7,9,11,9,12,12,8,7,11,11,14,10,8,10,12,10,8,9,8,8,10,8,7,9,9,13,9,8,9,9,7,7,8,9,11,9,8,10,13,11,9,10,8,8,13,7,10,10,10,12,13,11,10,13,8,7,10,9,9,8,8,9,9,8,7,7,14,13,8,11,7,8,11,10,12,9,11,11,8,9,7,12,12,10,9,12,10,9,10,11,10,10,8,9,7,10,13,4,11,12,7,13,9,7,9,13,10,11,8,10,9,10,10,10,9,12,10,13,6,8,10,12,11,7,9,8,13,11,9,9,12,9,8,11,11,10,10,13,11,8,9,7,9,9,10,12,7,9,7,11,8,12,12,7,11,9,10,10,11,12,11,14,10,9,8,8,9,11,10,10,10,12,11,10,9,12,9,12,13,14,11,9,7,9,7,9,13,10,7,12,10,9,8,10,9,10,5,11,9,12,7,9,3,12,7,9,9,10,8,7,10,10,11,11,9,11,8,9,9,9,10,10,11,11,8,10,11,10,9,13,9,8,13,10,11,8,10,11,10,9,11,9,9,9,11,11,11,6,11,11,11,10,12,10,8,10,10,9,8,6,7,9,8,11,7,8,10,8,10,10,9,9,9,11,7,9,8,10,10,10,10,7,8,10,7,9,8,9,11,7,8,12,8,8,9,7,7,8,5,9,6,8,7,12,7,7,9,4,5,9,7,10,6,10,4,4,8,11,7,7,8,5,9,8,4,7,7,8,8,9,9,11,10,8,5,11,8,9,11,8,8,14,7,7,8,10,9,7,6,10,9,8,8,7,9,8,7,9,9,5,7,9,8,10,8,6,8,10,10,12,10,8,8,12,7,11,9,9,9,7,10,10,12,12,6,8,6,11,9,11,10,12,11,10,9,11,9,9,12,11,8,8,9,11,6,9,10,6,7,8,9,9,7,11,8,11,8,11,10,6,11,9,9,6,7,9,6,10,6,10,5,8,9,7,9,12,10,10,7,8,10,12,9,8,11,9,11,12,9,9,11,10,8,11,8,9,8,9,13,10,6,10,8,9,8,9,10,8,8,10,10,7,11,13,8,6,12,7,11,11,9,12,9,10,10,10,9,10,9,10,8,13,12,9,10,11,11,11,10,12,9,12,10,10,13,11,11,10,9,9,9,12,8,10,11,10,9,10,5,6,9,11,8,8,8,9,7,10,6,8,13,12,8,8,7,9,4,7,10,8,9,12,7,9,9,7,8,10,11,11,9,11,10,9,11,12,10,8,7,9,11,6,12,11,9,8,7,7,13,12,10,10,8,13,13,10,9,8,12,8,13,12,11,9,12,12,10,11,7,7,9,11,7,13,9,10,9,9,7,13,9,11,8,11,12,8,11,12,11,10,10,10,8,13,9,9,7,11,8,9,9,10,11,10,9,8,14,11,8,10,8,10,10,11,7,9,12,12,9,8,7,10,9,10,12,10,8,9,8,10,9,8,8,10,7,8,12,9,10,12,11,11,9,9,7,9,12,9,9,10,7,12,8,9,9,8,12,7,8,8,11,10,12,8,12,14,10,11,12,8,9,9,8,11,13,10,10,8,8,9,9,10,7,9,10,10,9,10,11,10,10,8,7,8,11,13,12,8,9,12,10,11,11,8,7,8,7,9,10,8,9,7,6,11,8,6,9,5,9,9,9,8,8,9,8,7,8,7,10,10,10,11,6,9,10,8,8,6,13,9,6,10,8,11,7,11,7,9,7,7,9,10,6,7,8,8,7,10,7,8,7,11,8,9,8,8,8,8,4,7,0,6,9,9,7,9,7,9,10,9,10,8,9,9,9,7,9,6,8,5,7,9,13,8,8,9,8,9,7,10,8,10,9,12,9,6,9,9,12,6,11,13,11,12,8,10,9,12,9,6,12,6,10,9,7,9,11,9,9,9,11,10,10,10,9,10,5,10,8,9,8,11,8,8,11,10,9,9,9,9,9,8,8,10,10,10,9,9,8,7,7,9,11,10,7,7,8,7,5,11,8,9,8,8,8,9,7,9,8,7,12,10,12,11,12,10,10,9,11,10,8,9,6,11,10,7,7,8,8,11,7,9,10,10,14,9,8,8,10,11,9,12,10,11,10,11,9,8,10,9,9,9,7,8,10,11,8,10,8,11,13,9,10,9,9,12,12,10,10,11,11,11,10,14,7,9,10,12,10,8,8,11,8,10,10,9,11,9,11,7,8,12,10,11,10,11,12,10,8,13,9,6,11,7,8,7,10,11,10,9,9,9,8,8,7,12,9,7,9,11,11,10,11,13,6,9,10,11,14,10,6,13,10,11,9,9,7,12,8,10,9,11,11,10,10,8,11,10,11,11,12,13,11,10,8,11,10,13,13,9,10,12,14,9,10,10,11,10,11,8,8,13,13,8,12,9,10,10,7,7,10,7,11,6,11,8,12,12,9,10,8,10,7,9,7,11,11,10,10,11,10,8,11,8,7,9,8,10,12,10,9,10,9,10,11,6,10,11,8,12,8,10,6,12,12,10,11,11,13,10,8,10,12,10,12,10,9,11,15,12,12,9,8,14,13,13,12,12,9,12,11,11,9,12,9,11,11,12,10,12,10,12,13,13,9,10,9,9,8,12,8,7,6,9,13,8,8,12,6,12,10,9,10,9,12,8,12,11,5,12,6,7,8,9,9,9,11,10,8,12,8,10,9,8,9,10,6,7,7,7,9,7,6,6,9,8,8,8,8,9,8,10,9,10,5,9,8,8,10,10,11,9,6,6,8,9,10,12,7,8,7,10,10,8,8,8,7,11,12,7,14,10,13,9,8,12,9,7,9,11,10,9,9,10,10,10,9,10,10,10,9,8,8,9,11,12,7,12,10,11,10,11,9,8,9,9,10,10,10,10,7,10,12,9,11,12,9,8,9,9,8,10,11,8,10,8,8,11,12,13,8,10,9,8,10,8,10,7,8,10,6,8,10,9,9,10,6,9,9,11,10,10,8,8,7,12,7,6,10,9,12,8,10,8,7,7,9,13,8,9,8,12,8,8,10,10,10,9,10,10,7,10,8,8,13,10,9,13,8,9,11,10,11,9,10,9,5,9,6,11,12,10,9,9,10,10,12,11,9,12,11,9,8,11,6,9,11,9,11,10,9,10,12,10,11,10,8,11,10,10,11,7,9,11,7,12,9,10,7,5,10,10,9,11,8,11,10,8,11,7,9,11,9,8,9,8,13,8,12,12,9,10,11,8,5,10,12,10,9,9,8,11,7,11,8,11,9,11,11,11,10,11,7,13,12,10,8,8,7,9,11,9,9,11,12,11,12,8,9,12,12,7,8,11,12,8,10,11,11,11,8,10,11,12,13,9,11,10,12,11,8,14,12,10,7,14,10,10,6,9,11,11,7,13,8,10,8,11,10,12,13,14,9,8,10,10,11,8,10,11,8,12,13,11,10,12,7,9,11,10,9,8,7,10,8,11,7,10,14,9,7,9,8,10,9,9,10,10,10,10,7,8,9,9,12,13,9,12,9,10,10,11,12,12,9,15,10,10,10,9,11,11,11,12,8,10,14,11,11,12,11,11,12,10,12,11,13,10,8,10,10,9,11,10,8,12,11,10,9,9,13,11,8,9,9,8,9,11,8,8,7,9,9,8,11,12,8,11,10,9,8,10,10,9,11,7,9,6,9,10,7,7,9,7,10,10,9,9,9,8,11,10,10,6,8,9,10,7,4,8,10,6,10,8,8,8,8,9,7,11,10,8,8,7,9,8,10,9,6,10,11,8,9,12,10,11,6,10,8,8,8,9,8,11,11,9,5,8,10,7,11,7,7,11,11,10,10,8,9,9,7,10,12,11,14,11,7,10,13,9,9,9,11,12,12,11,8,9,11,11,12,8,9,10,12,10,11,8,6,11,7,9,6,12,11,10,8,10,9,11,10,10,9,8,9,8,7,11,7,10,6,6,10,10,9,8,10,10,8,7,7,5,12,7,7,7,8,9,8,9,8,8,6,11,7,10,10,7,10,8,8,11,10,5,11,10,9,10,7,13,11,9,10,9,9,11,12,12,7,11,11,11,11,12,6,13,11,9,10,7,11,8,10,9,10,10,10,9,6,9,10,7,8,9,13,12,10,10,12,6,12,12,10,11,10,11,9,10,8,9,11,11,7,9,8,12,13,10,10,9,10,10,8,10,9,10,12,8,12,13,11,11,8,7,10,8,10,8,9,7,6,9,11,11,16,10,9,12,11,11,9,9,9,10,8,11,9,9,9,8,10,11,9,12,9,9,8,10,9,9,4,11,12,9,7,9,6,10,10,9,11,7,14,10,9,11,8,12,9,9,10,8,11,11,12,10,10,11,9,11,9,9,10,11,10,8,10,11,8,11,10,10,10,13,14,10,13,13,13,11,12,11,9,12,11,10,8,12,11,11,10,10,10,13,8,8,9,12,11,13,11,12,10,11,10,9,13,6,8,10,11,12,7,10,11,11,10,7,10,12,10,9,6,12,10,10,10,11,10,8,8,8,13,13,14,12,8,8,10,11,11,10,9,14,10,8,10,8,11,11,15,15,11,10,15,11,6,9,11,11,10,12,8,10,10,11,7,12,11,11,11,10,11,12,15,13,10,12,12,14,11,10,7,8,9,9,12,12,11,13,10,10,12,9,5,11,11,12,10,11,11,11,10,8,10,10,8,10,10,8,9,7,14,13,9,12,7,10,8,10,8,8,8,10,9,10,8,5,13,8,9,11,10,6,9,12,10,10,11,10,5,5,10,7,10,10,11,10,5,9,9,9,7,10,10,10,10,10,10,7,8,7,8,7,11,9,10,12,12,11,7,11,9,7,8,8,8,10,10,8,11,13,10,8,11,11,8,7,9,10,10,12,10,11,10,8,12,12,9,10,10,7,12,11,10,12,10,9,10,10,6,12,10,12,8,7,9,8,9,11,8,12,10,11,13,13,7,10,7,8,9,9,7,7,7,8,10,9,10,10,9,11,9,8,11,10,7,7,8,11,5,8,7,9,6,6,6,10,7,7,7,10,7,10,9,12,9,7,12,10,11,8,10,8,10,10,7,10,13,8,7,11,10,11,6,10,9,13,6,8,8,9,11,13,9,11,8,11,11,9,9,9,10,10,11,11,8,10,8,10,9,11,13,11,11,11,10,10,12,9,10,11,11,11,12,9,12,10,11,10,10,11,9,9,9,11,15,11,9,11,7,10,10,12,8,12,9,9,8,11,7,9,10,7,9,11,8,7,10,12,10,10,12,12,9,12,8,9,10,12,11,7,9,6,9,13,11,12,7,12,9,10,8,9,10,9,10,13,8,10,12,9,13,10,10,13,7,9,13,9,9,9,11,8,12,11,11,8,8,12,15,12,11,9,9,11,9,11,12,10,14,13,11,12,10,10,12,10,11,9,8,10,10,6,8,12,9,12,12,11,9,10,11,14,11,8,9,12,11,14,9,12,7,12,10,11,12,10,10,11,11,11,11,10,12,9,9,10,10,9,10,9,7,10,9,12,11,10,11,8,10,11,10,9,9,9,8,11,10,11,8,13,9,11,11,11,11,11,12,13,10,10,13,12,9,9,9,13,12,8,11,8,11,11,10,11,8,10,12,11,11,13,14,11,12,7,12,13,12,15,12,12,11,12,13,10,11,12,13,12,11,14,10,14,10,13,10,15,14,11,11,9,13,13,12,15,11,8,9,10,14,8,12,14,11,10,10,11,10,10,9,13,12,9,11,8,12,11,10,14,8,11,12,9,14,7,11,14,9,9,11,8,11,9,11,7,13,12,12,12,11,9,12,12,15,6,10,11,10,12,12,12,10,11,13,12,12,11,9,15,14,13,12,11,9,12,11,13,9,13,15,9,11,10,11,12,13,11,14,14};
