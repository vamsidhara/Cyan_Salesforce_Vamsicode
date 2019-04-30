//This Class is used  to convert Currency Numbers to Words, also displays the last Decimals Nos to Words.

public class CurrencyToWords{
public integer intNum;     // for integer part
public integer decNum;     // for decimal part
public String numInWords; // For currency in Words
public String bigCurrencySingular    = 'Dollar';
public String bigCurrencyplural      = 'Dollars';
public String smlCurrencySingular    = 'Cent';
public String smlCurrencyplural      = 'Cents';
public String[]  ones = new string[] {  'Zero ',  'One ',  'Two ',  'Three ',  'Four ',  'Five ',  'Six ',  'Seven ',  'Eight ',  'Nine ',  'Ten ',  'Eleven ',  'Twelve ',  'Thirteen ',  'Fourteen ',  'Fifteen ',  'Sixteen ',  'Seventeen ',  'Eighteen ', 'Nineteen ' };
public String[]  tens = new string[] {  ' ',  'Ten ',  'Twenty ',  'Thirty ',  'Forty ',  'Fifty ',  'Sixty ',  'Seventy ',  'Eighty ',  'Ninety ' };
public integer[] base = new integer[]{0,1,10,100,1000,1000,1000,1000000,1000000,1000000,1000000000};
public String[]  unit = new String[] { ' ', ' ', ' ', 'Hundred ', 'Thousand ', 'Thousand ', 'Thousand ', 'Million ', 'Million ', 'Million ', 'Billion ', 'Billion', 'Billion ', 'Trillion '};

public CurrencyToWords(){
}    
public string CurrencyToWordsFormat(Decimal num){
String numToString = String.valueOf(num);
List<String> parts = numToString.split('\\.');
    if( parts != null && parts.size()>0) {
intNum = Integer.valueOf(parts[0]);
decNum = Integer.valueOf(parts[1]);
}
if( intNum == 0 )
numInWords = 'Zero';
if( intNum > 0 ){
if( intNum == 1 )
numInWords = NumberToWords(intNum) + bigCurrencySingular;
else
numInWords = NumberToWords(intNum) + bigCurrencyplural;
}
if( decNum > 0 ){
if( decNum == 1 )
numInWords += NumberToWords(decNum) + smlCurrencySingular;
else
numInWords += ' AND '+ NumberToWords(decNum) + smlCurrencyplural;
}
System.debug(num+':'+numInWords);
return numInWords;
}


public String NumberToWords(Integer num){
String words ='';
integer digit, den, rem;
digit = String.valueOf(num).length();
//System.debug(num+’:’+digit);
den = num / base[digit];
rem = Math.mod(num,base[digit]);
if( digit == 1 ){
words = ones[num];
}
else if( digit == 2 ){
if( den == 1 && rem >0 )
words = ones[num];
else{
words = tens[den];
if( rem > 0 )
words += NumberToWords(rem);
}
}
else if( digit > 2 ){
words += NumberToWords(den)+unit[digit];
if( rem > 0 )
words += NumberToWords(rem);
}
return words;
}  
    
}