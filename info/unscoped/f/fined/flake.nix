{

  inputs.packument.url   = "https://registry.npmjs.org/fined?rev=13-15e01fde9b9a71b4c7d434aa46dc9109";
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
    ident = "fined";
    ldir  = "info/unscoped/f/fined";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
