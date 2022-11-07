{

  inputs.packument.url   = "https://registry.npmjs.org/just-diff?rev=25-790a4649966bbe28a47e80fa09ae1ad6";
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
    ident = "just-diff";
    ldir  = "info/unscoped/j/just-diff";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
