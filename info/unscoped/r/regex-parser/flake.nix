{

  inputs.packument.url   = "https://registry.npmjs.org/regex-parser?rev=22-00b276fab75dcb070dd4c4081cc8cf22";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "regex-parser";
    ldir  = "info/unscoped/r/regex-parser";
    inherit packument fetchInfo;
  } // latest';

}
