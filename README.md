Aims to complement https://github.com/unee-t/bz-database with
[skeema](https://github.com/skeema/skeema/) derived **schema**.

Why?

* So we can easily check inconsistencies between environments
* So we can check on **CALL mysql.lambda_async** usage, esp with [base64 encoding](https://github.com/unee-t/bz-database/issues/73)

# Setup

	 grep -v pass ~/.skeema  | grep .
	[bugzilla-dev]
	[bugzilla-demo]
	[bugzilla-prod]
	[unte-dev]
	[unte-demo]
	[unte-prod]

