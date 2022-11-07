{

  inputs.packument.url   = "https://registry.npmjs.org/sort-keys?rev=23-b5cecb38e264e2376e849e2d0e135186";
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
    ident = "sort-keys";
    ldir  = "info/unscoped/s/sort-keys";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
