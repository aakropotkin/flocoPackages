{

  inputs.packument.url   = "https://registry.npmjs.org/is-buffer?rev=28-73311ada934bee2c9de88d107cbcfe1d";
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
    ident = "is-buffer";
    ldir  = "info/unscoped/i/is-buffer";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
