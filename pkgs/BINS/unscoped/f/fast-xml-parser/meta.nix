{ version }: {
  binInfo.binPairs =
    if 0 <= ( builtins.compareVersions "4" version )
    then { xml2js = "cli.js"; }
    else { fxparser = "src/cli/cli.js"; };
}
