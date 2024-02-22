# Optimised-Encoder-and-Decoder-blocks-for-Modified-Radix-4-booth-multiplier

This project is about optimizing a radix-4 Modified Booth multiplier. This multiplier has an encoder and a decoder that are important for creating partial products. It adjusts the multiplicand based on 3-bit windows from the multiplier's segmentation, making it more accurate, especially in applications like divisions and filters where errors are a big deal. The focus of the project is on saving power, and it suggests two new ways to set up the encoder (MBE) and decoder (MBD) to reduce unnecessary operations in creating partial products. These setups are simple and easy to use for different numbers of input bits.  

Comparing the results, the project shows that the new setups are better in terms of both the space they take up and the power they use, compared to the usual multiplexer-based multipliers. This is particularly important when we need to save resources. When used in Fast Fourier Transform butterflies, the improved multipliers do better than those using the standard ‘*' operator. This means they're better in terms of space, power, and how fast they work. Overall, these improvements can make a real difference in applications that process signals.  

For detailed explanation, please refer ![here](https://iiitbac-my.sharepoint.com/personal/lasya_g_iiitb_ac_in/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Flasya%5Fg%5Fiiitb%5Fac%5Fin%2FDocuments%2Fdcmos%5Fproject%2FDCMOS%20Project%20report%2Epdf&parent=%2Fpersonal%2Flasya%5Fg%5Fiiitb%5Fac%5Fin%2FDocuments%2Fdcmos%5Fproject&ga=1) 


