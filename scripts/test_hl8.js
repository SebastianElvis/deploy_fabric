'use strict';

const loadtest = require('loadtest');
const sleep = require('sleep');
const args = process.argv;
const jsonfile = require('jsonfile');

var chaincode_name = "f244e9b16fb29d1edd6ca9ebdedab98dc891413b6d0196de9d5c7e380917d8b683c427551a71de5f73701ff8347518f7be8e996b00e3a030e4ce162d743b5c14";
const batch_size = 20000;

var invoke_chaincode_json = {
    "jsonrpc": "2.0",
    "method": "invoke",
    "params": {
      "type": 1,
      "chaincodeID":{
        "name": chaincode_name
      },
      "ctorMsg": {
        "function":"write",
        "args":['0', batch_size.toString()]
      }
    },
    "id": 3
};
var invoke_chaincode_json = JSON.stringify(invoke_chaincode_json);

var options = {
	url: 'http://localhost:7050/chaincode',
	concurrent: 10,
	method: 'POST',
	body:'',
	requestsPerSecond: 10,
	maxSeconds: 10,
	requestGenerator: function(params, options, client, callback){
		options.headers['Content-Length'] = invoke_chaincode_json.length;
		options.headers['Content-Type'] = 'application/json';
		//options.body = 'YourPostData';
		//options.path = 'YourURLPath';
		var request = client(options, callback);
		request.write(invoke_chaincode_json);
		return request;
	}
};


var results_obj = {};

var test = function(options, rps, results_obj){
	options.requestsPerSecond = rps;
	loadtest.loadTest(
        	options,
        	function(error, results){
                	if (error){
                        	return console.error('Got an error: %s', error);
                	}
                	console.log(results);
                	results_obj[''+rps] = results;
			console.log('Tests run successfully --- ' + rps+ "\n\n");
			var sec = 20;
			if(rps <= 1000){
				console.log('Sleep for ' + sec + ' seconds...');
				sleep.sleep(sec);
				test(options, rps+100, results_obj);
        		} else {
				console.log(results_obj);
				jsonfile.writeFile('./data/results-sleep' + sec + '-' + args[2] + '.json', results_obj, function (err) {
					console.error(err);
                                        process.exit();
				});
				               	
			}
		}
	);
}

test(options, 100, results_obj);
