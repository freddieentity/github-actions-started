```sh

for i in {build,unit-test,mutation-test,sca,sast,container-image-scan,container-image,deploy,integration-test,dast,environment-promotion,kubesec}
do
    # echo -e '#!/bin/bash \n# '$i'.sh' > ${i}.sh
    chmod 755 ${i}.sh
done
```