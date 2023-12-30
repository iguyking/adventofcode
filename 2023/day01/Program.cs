using System.Text.RegularExpressions;
using System.Diagnostics;
// See https://aka.ms/new-console-template for more information


//string day1file = "day01part01-testdata.txt";  // Part 1 = 142, Part 2 = 142
//string day1file = "day01part02-testdata.txt";     // Part 2 = 281
//string day1file = "day01part01-mytest.txt";    // Part 1 = 154, Part 2 = 155
string day1file = "day01part01.txt";  // actual data file



// Day 1 Part 1
int part1total = 0;
foreach (string calibration in System.IO.File.ReadLines(@day1file))
{
    Debug.WriteLine(calibration);
    string firstdigit = new string(calibration.Where(c => char.IsDigit(c)).Take(1).ToArray());
    char[] revered= calibration.ToCharArray();
    Array.Reverse(revered);
    string reveredstr = new string(revered);
    string lastdigit = new string(revered.Where(c => char.IsDigit(c)).Take(1).ToArray());
    if (firstdigit.Length == 0) { firstdigit = "0"; }
    if (lastdigit.Length == 0) { lastdigit = "0"; }


    part1total += Int32.Parse($"{firstdigit}{lastdigit}");
    Debug.WriteLine($"Part1: {firstdigit},{lastdigit} - {part1total}");
}

// Day 1 Part 2
int part2total = 0;
foreach (string calibration in System.IO.File.ReadLines(@day1file))
{
    Debug.WriteLine(calibration);
    string replacecalibration = Advent.ReplaceTextNumbers(calibration);
    Console.WriteLine(replacecalibration); 
    string firstdigit = new string(replacecalibration.Where(c => char.IsDigit(c)).Take(1).ToArray());
    char[] revered = replacecalibration.ToCharArray();
    Array.Reverse(revered);
    string reveredstr = new string(revered);
    string lastdigit = new string(revered.Where(c => char.IsDigit(c)).Take(1).ToArray());
    part2total += Int32.Parse($"{firstdigit}{lastdigit}");
    Debug.WriteLine($"Part2: {firstdigit},{lastdigit} - {part2total}");
}

Console.WriteLine($"Day1Part1 Total: {part1total}");
Console.WriteLine($"Day1Part2 Total: {part2total}");
public class Advent 
{
    public static string ReplaceTextNumbers (string s) 
    {
        IDictionary<string, int> textNumbers = new Dictionary<string, int>();
        textNumbers.Add("oneight", 18);
        textNumbers.Add("twone", 21);
        textNumbers.Add("threeight",38);
        textNumbers.Add("fiveight", 58);
        textNumbers.Add("nineight", 98);
        textNumbers.Add("sevenine", 79);
        textNumbers.Add("eightwo", 82);
        textNumbers.Add("eighthree", 83);
        textNumbers.Add("one", 1);
        textNumbers.Add("two", 2);
        textNumbers.Add("three", 3);
        textNumbers.Add("four", 4);
        textNumbers.Add("five", 5);
        textNumbers.Add("six", 6);
        textNumbers.Add("seven", 7);
        textNumbers.Add("eight", 8);
        textNumbers.Add("nine", 9);

        
        string returnstr = textNumbers.Aggregate(s, (current,value) => current.Replace(value.Key.ToString(), value.Value.ToString()));        
        Debug.WriteLine($"StringMatch: {returnstr}");
        return new string(returnstr);
    }
}
