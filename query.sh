# Sends local testing query to localhost:9000 where docker container is being run from init.sh

curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '
{
	"submissionId": 198936,
	"grader": true, 
	"problemType": "Communication",
	"language": "cpp",
	"problemName": "magick",
	"regradeall": false,
	"regrade":false,
	"stitch": false,
	"username": "0rang3",
	"submissionTime": "2022-12-21 17:10:51"
}'