{

  inputs.packument.url   = "https://registry.npmjs.org/known-css-properties?rev=38-b0bd015581d314d3e46f6fa9d74a9a08";
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
    ident = "known-css-properties";
    ldir  = "info/unscoped/k/known-css-properties";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
