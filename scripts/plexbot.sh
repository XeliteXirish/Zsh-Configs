#!/usr/bin/env sh

SOURCE="/media/StorageLarge/Downloads"
DEST="/media/StorageLarge/PlexMedia/"

/usr/bin/filebot -script dev:amc --output "$DEST" --action move -non-strict "$SOURCE" --conflict auto --log-file ~/.filebot/amc.log --def excludeList=~/.filebot/amc.txt  --def clean=y --def music=y --def artwork=n --def unsorted=y --def extras=y --def seriesFormat="${DEST}TV/{n.replaceAll(/'/)}/Season {s.pad(2)}/{n} - {s00e00} - {t}" --def exec="curl
'http://localhost:8081/api/f9af03d2fbf73e8d085354aa1d756e3d?cmd=show.refresh&tvdbid={info.id}'" 
