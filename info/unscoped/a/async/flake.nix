{

  inputs.packument.url   = "https://registry.npmjs.org/async?rev=1680-5b859b64c0c430adfa82eff90e780bc3";
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
    ident = "async";
    ldir  = "info/unscoped/a/async";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
