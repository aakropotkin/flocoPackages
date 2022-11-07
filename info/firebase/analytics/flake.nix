{

  inputs.packument.url   = "https://registry.npmjs.org/@firebase/analytics?rev=1886-e6258a627df8e688283f7cee61762c54";
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
    scope = "@firebase";
    ident = "@firebase/analytics";
    ldir  = "info/firebase/analytics";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
