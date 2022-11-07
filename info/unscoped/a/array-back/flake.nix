{

  inputs.packument.url   = "https://registry.npmjs.org/array-back?rev=24-a049c6ed84572312b2bb871488be8103";
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
    ident = "array-back";
    ldir  = "info/unscoped/a/array-back";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
