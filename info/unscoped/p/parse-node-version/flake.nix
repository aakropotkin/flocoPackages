{

  inputs.packument.url   = "https://registry.npmjs.org/parse-node-version?rev=5-ed3bf37e4c19f44419f66d54b85c54fb";
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
    ident = "parse-node-version";
    ldir  = "info/unscoped/p/parse-node-version";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
