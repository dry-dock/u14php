FROM drydock/u14:{{%TAG%}}

ADD . /u14php

RUN /u14php/install.sh
