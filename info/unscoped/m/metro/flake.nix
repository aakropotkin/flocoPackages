{

  inputs.packument.url   = "https://registry.npmjs.org/metro?rev=191-ab692c4279130ba9978c644429254f5a";
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
    ident = "metro";
    ldir  = "info/unscoped/m/metro";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
