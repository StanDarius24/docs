pathToBackupScript="/var/backup/"

date_now=$(date +'%Y-%m-%d')
cd $pathToBackupScript
cd 'daily'

for filename in `ls`; do
        date_diff=$(( ($(date -d "$date_now UTC" +%s) - $(date -d "$filename UTC" +%s)) / (60*60*24) ))
        if (($date_diff > 31));
                then
                echo $filename
                cd ..
                size=`du -hs daily`
                size1=`du -hs daily/$filename`
                echo "backup: $date_now total_size: $size name: $filename size: $size1" >> log.data
                if test -d "monthly";
                        then
                        echo "monthly exists"
                        rm -rf monthly
                        mv daily/ monthly
                        mkdir daily
                else
                        mv daily/ monthly
                        mkdir daily
                break
                fi
        fi
done

