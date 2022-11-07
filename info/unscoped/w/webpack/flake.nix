{

  inputs.packument.url   = "https://registry.npmjs.org/webpack?rev=1842-f46f327c26cc134c1d785570d1519607";
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
    ident = "webpack";
    ldir  = "info/unscoped/w/webpack";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
