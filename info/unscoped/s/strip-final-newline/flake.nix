{

  inputs.packument.url   = "https://registry.npmjs.org/strip-final-newline?rev=2-014479cd11f715f87aeb7bf2218a14d8";
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
    ident = "strip-final-newline";
    ldir  = "info/unscoped/s/strip-final-newline";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
