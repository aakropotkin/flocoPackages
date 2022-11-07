{

  inputs.packument.url   = "https://registry.npmjs.org/to-regex-range?rev=25-fe0cfa69c3914321080c1f8f4d7b5052";
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
    ident = "to-regex-range";
    ldir  = "info/unscoped/t/to-regex-range";
    inherit packument fetchInfo;
  } // latest';

}
