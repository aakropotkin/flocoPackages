{

  inputs.packument.url   = "https://registry.npmjs.org/inert?rev=154-b6dc67029389720f0b74409c6b15052a";
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
    ident = "inert";
    ldir  = "info/unscoped/i/inert";
    inherit packument fetchInfo;
  } // latest';

}
