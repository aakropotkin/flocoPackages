{

  inputs.packument.url   = "https://registry.npmjs.org/wrap-ansi?rev=45-ed918173e1ad40c30f02be00d7da8a53";
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
    ident = "wrap-ansi";
    ldir  = "info/unscoped/w/wrap-ansi";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
