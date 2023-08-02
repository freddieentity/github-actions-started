```sh

for i in {build,unittest,mutationtest,sca,sast,containerimagescan,buildpushimage,kubernetesmanifestscan,deploy,integrationtest,dast,environmentpromotion,kubernetescisbenchmark}
do
    echo -e '#!/bin/bash \n# '$i'.sh' > ${i}.sh
done
```