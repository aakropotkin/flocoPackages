{

  inputs.packument.url   = "https://registry.npmjs.org/humanize-ms?rev=13-38f5032180440c9ce1d2bd2de02b59d2";
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
    ident = "humanize-ms";
    ldir  = "info/unscoped/h/humanize-ms";
    inherit packument fetchInfo;
  } // latest';

}
