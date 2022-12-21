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

    os.chdir('/tmp')

    ''' Python: NO COMPILATION NECESSARY '''
    if language == 'py':
        return {'status': 200, 'error': ''}

    ''' FOR C++ CODES '''
    if problemType == 'Batch': 
        return compilesub.compileBatch(submissionId, problemName, grader, language)
    elif problemType == 'Interactive':
        return compilesub.compileInteractive(submissionId, problemName, grader, language)
    elif problemType == 'Communication':
        return compilesub.compileCommunication(submissionId, problemName, grader, language)
