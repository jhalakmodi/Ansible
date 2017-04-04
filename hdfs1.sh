#!/bin/bash
today=`date +'%Y%m%d'`
bucketname="bucket-name"
sourcepath="/somepath/source-folder-list.txt"
while IFS= read line
do
        # display $line and then copy $line into S3
	echo "$line"
	# use below when copying with any host otherthan Hadoop
	#aws s3 cp "$line" s3://"$bucketname"
	# Below code is specific to Hadoop
	hadoop distcp hdfs://"$line" s3a://"$bucketname"
	# Use below while uploading large amounts of data
	# hadoop distcp -D fs.s3a.fast.upload=true  "$line"  s3a://"$bucketname"
done <"$sourcepath"
