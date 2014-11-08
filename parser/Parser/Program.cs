using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using CsvHelper;

namespace Parser
{
    class Program
    {
        static void Main(string[] args)
        {
#region Util/timestamps.txt 
            using (TextReader reader = File.OpenText("DemoData/Util/timestamps.txt"))
            {
                string filePath = @"Z:\TEMP_MATIJA\Paradigma - OST 2014\";
                TextWriter writer = new StreamWriter("DemoData/Util/lab_timestamps.txt");
                var csvw = new CsvWriter(writer);
                var csv = new CsvReader(reader);
                csv.Configuration.Delimiter = "\t";
                int counter = 0;
                while (csv.Read())
                {
                    if (counter == 0)
                    {
                        counter++;
                        continue;
                    }

                    var time = csv.GetField("Time");
                    var info = csv.GetField("Info");
                    var type = csv.GetField("Type");
                    var sot = csv.GetField("Stamped Object Type");
                    var label = csv.GetField("Label");

                    info = info.Replace(filePath, "");

                    csvw.WriteField(time);
                    csvw.WriteField(info);
                    csvw.WriteField(type);
                    csvw.WriteField(sot);
                    csvw.WriteField(label);
                    csvw.NextRecord();

                    Console.Write(time);
                    Console.Write(info);
                    Console.Write(type);
                    Console.Write(sot);
                    Console.Write(label);
                    Console.WriteLine("\n");
                }
                csvw.Dispose();
                csv.Dispose();
            }
            //END Util/timestamps.txt

            //Console.ReadLine();
#endregion

        }
    }
}
