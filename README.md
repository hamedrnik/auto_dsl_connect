## DESCRIPTION
Auto DSL Connect Automatically connects to dsl connection in NetworkManager for GNU/Linux.
The script connects to "second_dsl_provider" from 3 A.M. until 7 A.M. and in the other
hours connect to "first_dsl_provider".
You can change name of connections and hours by editing the adc.sh file.


## REQUIREMENTS
* networkmanager
* cnetworkmanager

## HOW TO
After installing requirements, you have to make two adsl connection in networkmanager.
For example I made "first_dsl_provider" and "second_dsl_provider" if your connection
name differs from me you can change the names in the begining of adc.sh file.
after that, make it executable and put it in startup or make a cron job.

## CONTACT
you can find me in http://free8beautifullife.wordpress.com/ or contact me with
"iceage2098" email in gmail.com

## LICENSE
Automatically connects to dsl connection in NetworkManager for GNU/Linux.
    Copyright (C) 2010  Hamed Ramezanian

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

