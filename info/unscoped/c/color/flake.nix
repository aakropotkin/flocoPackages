{

  inputs.packument.url   = "https://registry.npmjs.org/color?rev=145-bf2214e717294c4d00179cace40808de";
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
    ident = "color";
    ldir  = "info/unscoped/c/color";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
