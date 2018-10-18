#!/usr/bin/env sh

/usr/bin/filebot -script dev:amc --output "$PLEX_DEST" --action move -non-strict "$T_DOWNLOADS" --conflict auto --log-file ~/.filebot/amc.log --def excludeList=~/.filebot/amc.txt  --def clean=y --def music=y --def artwork=n --def unsorted=y --def extras=y --def seriesFormat="${PLEX_DEST}TV/{n.replaceAll(/'/)}/Season {s.pad(2)}/{n} - {s00e00} - {t}" --def exec="curl
'http://localhost:8081/api/f9af03d2fbf73e8d085354aa1d756e3d?cmd=show.refresh&tvdbid={info.id}'" 
