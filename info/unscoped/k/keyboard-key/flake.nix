{

  inputs.packument.url   = "https://registry.npmjs.org/keyboard-key?rev=6-a55996f2319a20d95278da17662f25eb";
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
    ident = "keyboard-key";
    ldir  = "info/unscoped/k/keyboard-key";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
