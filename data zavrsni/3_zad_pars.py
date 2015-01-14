import os
import re
import csv

def parseLine(line):
	l = line.split(',')
	if len(l) == 2:
		return float(l[0] + '.' + l[1])
	else:
		return line

def main():
	folder = []
	folder.append("DemoData1160/Video")
	folder.append("DemoData1161/Video")
	print folder
	
	
	for f in folder:
		distcsv = open(f + "/Overall_Dist_activity.csv", "wb")
		distwriter = csv.writer(distcsv, dialect='excel')
		DRelcsv = open(f + "/8,3 (D)(3DRel).csv", "wb")
		Drelwriter = csv.writer(DRelcsv, dialect='excel')
		fp = open(f + "/featurePoints.txt", "r")
		
		rp = open(f + "/rawPoints.txt", "r")
		timecsv = open(f + "/time.csv", "wb")
		timewriter = csv.writer(timecsv, dialect='excel')
		ecxcsv = open(f + "/Eye Closure X.csv", "wb")
		ecxwirter = csv.writer(ecxcsv, dialect='excel')
		
		lines = fp.readlines()
		lines2 = rp.readlines()
		tmp = lines[0]
		tmp2 = lines2[0]
		print tmp
		tmp = tmp.split("\t")
		tmp2 = tmp2.split("\t")
		for i in range(0, len(tmp)):
			if tmp[i] == "8,3 (D)(3DRel)":
				col1 = i
			if tmp[i] == "Overall Dist activity":
				col2 = i
		for i in range(0 , len(tmp2)):
			if tmp2[i] == "Time":
				col3 = i
			if tmp2[i] == "Eye closure X (left)":
				col4 = i
		
		print col3, col4
		
		for line in range(1, len(lines)):
			#print line
			l = lines[line].split()
			l2 = lines2[line].split()
			#k = l[col2].split(',')
			#csvLine = float(k[0] + '.' + k[1])
			distwriter.writerow([parseLine(l[col2])])
			Drelwriter.writerow([parseLine(l[col1])])
			timewriter.writerow([parseLine(l2[col3])])
			ecxwirter.writerow([parseLine(l2[col4])])
			#print line, l[col2]
			
	#print col1, col2
	
	return



	
main()