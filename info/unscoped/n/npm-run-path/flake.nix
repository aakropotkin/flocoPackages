{

  inputs.packument.url   = "https://registry.npmjs.org/npm-run-path?rev=19-2f97fdc6e5779aac2184d17a542ab7ba";
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
    ident = "npm-run-path";
    ldir  = "info/unscoped/n/npm-run-path";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
