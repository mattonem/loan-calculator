|newRepository|
Smalltalk vm maxExternalSemaphoresSilently: 1000.
newRepository := IceRepositoryCreator new
				repository: nil;
				location: '.' asFileReference ;
				createRepository .
newRepository register.

LoanCalculator appFolder: './build' asFileLocatorOrReference ensureCreateDirectory.
LoanCalculator exportApp.
