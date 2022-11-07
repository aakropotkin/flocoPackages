{

  inputs.packument.url   = "https://registry.npmjs.org/supports-hyperlinks?rev=6-d65ae321745a8afd3d6e5d2ee77e23c5";
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
    ident = "supports-hyperlinks";
    ldir  = "info/unscoped/s/supports-hyperlinks";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
