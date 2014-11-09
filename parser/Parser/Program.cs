using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Xml;
using CsvHelper;

namespace Parser
{
    class Program
    {
        static void Main(string[] args)
        {
            //Config
            string featureXMLtoCSV = "Phisiology/HR";
            //END config


            #region Util/timestamps.txt
            using (TextReader reader = File.OpenText("DemoData/Util/timestamps.txt"))
            {
                string filePath = @"Z:\TEMP_MATIJA\Paradigma - OST 2014\";
                TextWriter writer = new StreamWriter("DemoData/Util/timestamps.csv");
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
                }
                csvw.Dispose();
                csv.Dispose();
            }
            #endregion

            #region XML to CSV of all <X>data</X><Y>data</Y> to data,data
            TextWriter dataWriter = new StreamWriter("DemoData/" + featureXMLtoCSV + ".csv");
            using (CsvWriter csvw = new CsvWriter(dataWriter))
            {
                XmlTextReader reader = new XmlTextReader("DemoData/" + featureXMLtoCSV + ".xml");
                int counter = 0;
                while (reader.Read())
                {
                    counter++;
                    switch (reader.NodeType)
                    {
                        case XmlNodeType.Text: 
                            csvw.WriteField(reader.Value);
                            break;
                        case XmlNodeType.EndElement: 
                            if (reader.Name == "Y")
                            {
                                csvw.NextRecord();
                            }
                            break;
                    }
                }
                csvw.Dispose();
                dataWriter.Dispose();
            }
            #endregion


        }
    }
}
