{

  inputs.packument.url   = "https://registry.npmjs.org/is-url?rev=34-b18911b4e6c40cc3c9658f840229e1cb";
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
    ident = "is-url";
    ldir  = "info/unscoped/i/is-url";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
