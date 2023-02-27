# COMPILES FILE AND RETURNS ANY ERROR
# Return 422 unprocessable entity for compile errors
# Return 200 for success

import os
import subprocess
import compilesub

def lambda_handler(event, context):
    submissionId = event['submissionId']
    problemName = event['problemName']
    grader = event['grader']
    problemType = event['problemType']
    language = event['language']
    submissionTime = event['submissionTime']

    os.chdir('/tmp')

    ''' Python: NO COMPILATION NECESSARY '''
    if language == 'py':
        res = {'status': 200, 'error': ''}
    elif problemType == 'Batch': 
        res = compilesub.compileBatch(submissionId, problemName, grader, language)
    elif problemType == 'Interactive':
        res = compilesub.compileInteractive(submissionId, problemName, grader, language)
    elif problemType == 'Communication':
        res = compilesub.compileCommunication(submissionId, problemName, grader, language)
    else:
        return {'status': 300, 'error': 'Invalid Problem Type!'}

    # Compile successful, update subDelay and subLimit
    if res['status'] == 200:
        awstools.registerSubmission(username, problemName, submissionTime)

    return res